module SRVectorStorage
  class Base
    attr_reader :data

    def to_s; self.data.to_s end
    def storage_name; self.class.to_s end

    def sparse?
      raise "NOT IMPLEMENTED"
    end

    def dense?
      raise "NOT IMPLEMENTED"
    end
  end
end
