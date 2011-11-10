module SRMatrixStorage
  class Base

    include ::SRMatrixHelpers::ConversionHelper

    attr_reader :data
    attr_reader :row_size
    attr_reader :column_size

    def to_s; self.data.to_s end
    def storage_name; self.class.to_s end

    def sparse?
      raise "NOT IMPLEMENTED"
    end

    def dense?
      raise "NOT IMPLEMENTED"
    end

    def [](i, j)
      raise "NOT IMPLEMENTED"
    end

    def []=(i, j, v)
      raise "NOT IMPLEMENTED"
    end
  end
end
