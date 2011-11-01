class SRMatrix

  attr_reader :storage

  def SRMatrix.[](data)
    self.class.new(data, :dense)
  end

  def initialize(data, storage_arg=nil)
  end

end