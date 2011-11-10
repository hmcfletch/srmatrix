module SRMatrixStorage
  module SparseStorage
    class DOK

      def initialize(data_arg)
        data_arg = convert_to_hash(data_arg, copy)
        @row_size = data_arg.length
        @column_size = 0
        data_arg.each_pair do |k,v|
          num_elems = v.length
          data_arg[k] = convert_to_hash(v, copy)
          @row_size = k + 1 if k + 1 > @row_size

          tmp_num_col = [num_elems, data_arg[k].empty? ? 0 : data_arg[k].keys.max + 1].max
          @column_size = tmp_num_col if tmp_num_col > @column_size
          # remove the row if it is empty
          data_arg.delete(k) if rows[k].empty?
        end

        @row_size = num_rows
        @column_size = num_columns

        # set defaults for the hashes
        data_arg.default = Hash.new(0)
        data_arg.keys.each do |k|
          data_arg[k].default = 0
        end

        @data = rows
      end

      def storage_name; "Sparse::DOK" end

      def [](i, j)
        return nil if i >= row_size || j >= column_size
        data.fetch(i) { return 0 }[j]
      end

      def []=(i, j, v)
        data[i][j] = v
      end

    end
  end
end