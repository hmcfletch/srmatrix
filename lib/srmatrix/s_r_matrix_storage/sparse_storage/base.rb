module SRMatrixStorage
  module SparseStorage
    class Base < ::SRMatrixStorage::Base
      def sparse?
        true
      end

      def dense?
        false
      end
    end
  end
end