class SRVector

  attr_reader :storage

  def SRVector.[](data)
    self.class.new(data, :dense)
  end

  def initialize(data, storage_arg=:dense)
    @storage = if storage_arg == :dense
      SRVectorStorage::DenseStorage.new(data)
    elsif storage_arg == :dok
      SRVectorStorage::SparseStorage::DOK.new(data)
    elsif storage_arg == :csc
      SRVectorStorage::SparseStorage::CSC.new(data)
    end
  end

  def dense?
    self.storage.dense?
  end

  def sparse?
    self.storage.sparse?
  end

  def inspect
    "SRMatrix[#{self.storage.storage_name}]:#{self.storage.to_s}"
  end

end