class SRMatrix

  attr_reader :storage

  def SRMatrix.[](data)
    self.class.new(data, :dense)
  end

  def initialize(data, storage_arg=:dense)
    @storage = if data.is_a?(SRMatrixStorage::Base)
      data
    elsif storage_arg == :dense
      SRMatrixStorage::DenseStorage.new(data)
    elsif storage_arg == :dok
      SRMatrixStorage::SparseStorage::DOK.new(data)
    elsif storage_arg == :csc
      SRMatrixStorage::SparseStorage::CSC.new(data)
    elsif storage_arg == :csr
      SRMatrixStorage::SparseStorage::CSR.new(data)
    end
  end

  def dense?
    self.storage.dense?
  end

  def sparse?
    self.storage.sparse?
  end

  def [](i, j)
    self.storage[i,j]
  end

  def []=(i, j, v)
    self.storage[i,j] = v
  end

  def row_size
    storage.row_size
  end

  def column_size
    storage.column_size
  end

  def inspect
    "SRMatrix[#{self.storage.storage_name}]:#{self.storage.to_s}"
  end

  def *(m)
    return self.class.new(self.storage * m)
  end
end