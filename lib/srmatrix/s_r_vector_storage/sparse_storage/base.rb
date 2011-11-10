module SRVectorStorage
  module SparseStorage
    class Base < ::SRVectorStorage::Base
      def sparse?
        true
      end

      def dense?
        false
      end
    end
  end
end