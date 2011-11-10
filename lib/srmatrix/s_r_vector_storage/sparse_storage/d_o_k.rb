module SRVectorStorage
  module SparseStorage
    class DOK
      def initialize(data_arg)
        @data = data_arg
      end

      def storage_name; "Sparse::DOK" end
    end
  end
end