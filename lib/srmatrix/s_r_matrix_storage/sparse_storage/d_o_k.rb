module SRMatrixStorage
  module SparseStorage
    class DOK < Base

      def initialize(data_arg)
        data_arg = convert_to_hash(data_arg)
        @row_size = data_arg.length
        @column_size = 0
        data_arg.each_pair do |k,v|
          num_elems = v.length
          data_arg[k] = convert_to_hash(v)
          @row_size = k + 1 if k + 1 > @row_size

          tmp_num_col = [num_elems, data_arg[k].empty? ? 0 : data_arg[k].keys.max + 1].max
          @column_size = tmp_num_col if tmp_num_col > @column_size
          # remove the row if it is empty
          data_arg.delete(k) if data_arg[k].empty?
        end

        # set defaults for the hashes
        data_arg.default = Hash.new(0)
        data_arg.keys.each do |k|
          data_arg[k].default = 0
        end

        @data = data_arg
      end

      def storage_name; "Sparse::DOK" end

      def [](i, j)
        return nil if i >= row_size || j >= column_size
        data.fetch(i) { return 0 }[j]
      end

      def []=(i, j, v)
        data[i][j] = v
      end

      def *(m)
        case(m)
        when Numeric
          rows = {}
          data.keys.each do |i|
            rows[i] = {}
            data[i].keys.each do |j|
              rows[i][j] = data[i][j] * m
            end
          end
          return self.class.new(rows)
        when SRVector
          raise "NOT IMPLEMENTED"
        when SRMatrix
          case (m.storage)
          when SRMatrixStorage::DenseStorage
            return m.storage * self
          when SRMatrixStorage::SparseStorage::DOK
            c = {}
            row_size.times do |i|
              c[i] = {}
              m.column_size.times do |j|
                c_ij = 0
                data[i].each_pair do |k,v|
                  c_ij += v * m[k,j]
                end
                c[i][j] = c_ij unless c_ij == 0
              end
            end

            return self.class.new(c)
          end
        end
      end

    end
  end
end