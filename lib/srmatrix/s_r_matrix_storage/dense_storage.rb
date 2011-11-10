module SRMatrixStorage
  class DenseStorage < Base

    def initialize(data_arg)
      data_arg = convert_to_array(data_arg)
      data_arg.map! do |row|
        convert_to_array(row)
      end

      @column_size = (data_arg[0] || []).size
      @row_size = data_arg.size

      data_arg.each do |row|
        # Matrix.Raise ErrDimensionMismatch, "row size differs (#{row.size} should be #{column_size})" unless row.size == column_size
      end

      @data = data_arg
    end

    def sparse?
      false
    end

    def dense?
      true
    end

    def [](i, j)
      data.fetch(i){return nil}[j]
    end

    def []=(i, j, v)
      @data[i][j] = v
    end

    def *(m)
      case(m)
      when Numeric
        data = @data.collect do |row|
          row.collect { |e| e * m }
        end
        return self.class.new(data)
      when SRVector
        raise "NOT IMPLEMENTED"
      when SRMatrix
        raise "ErrDimensionMismatch" if column_size != m.row_size

        data = Array.new(row_size) do |i|
          Array.new(m.column_size) do |j|
            (0 ... column_size).inject(0) do |vij, k|
              vij + self[i,k] * m[k,j]
            end
          end
        end
        return self.class.new(data)
      end
    end

  end
end