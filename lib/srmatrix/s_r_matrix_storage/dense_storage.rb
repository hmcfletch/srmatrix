module SRMatrixStorage
  class DenseStorage < Base

    extend ::SRMatrixHelpers::ConversionHelper

    def initialize(data_arg)
      data_arg = convert_to_array(data_arg)
      data_arg.map! do |row|
        convert_to_array(row, copy)
      end

      @column_size = (data_arg[0] || []).size
      @row_size = data_arg.size

      data_arg.each do |row|
        # Matrix.Raise ErrDimensionMismatch, "row size differs (#{row.size} should be #{column_size})" unless row.size == column_size
      end
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

  end
end