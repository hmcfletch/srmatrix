module SRVectorStorage
  class DenseStorage < Base
    def initialize(data_arg)
      @data = data_arg
    end

    def sparse?
      false
    end

    def dense?
      true
    end
  end
end