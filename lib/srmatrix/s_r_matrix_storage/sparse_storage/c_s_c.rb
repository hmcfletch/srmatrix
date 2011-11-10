module SRMatrixStorage
  module SparseStorage
    class CSC < Base
      def initialize(data_arg)
        @data = data_arg
      end

      def storage_name; "Sparse::CSC" end
    end
  end
end