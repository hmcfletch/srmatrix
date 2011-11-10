module SRMatrixStorage
  module SparseStorage
    class CSR
      def initialize(data_arg)
        @data = data_arg
      end

      def storage_name; "Sparse::CSR" end
    end
  end
end