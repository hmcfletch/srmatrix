module SRMatrixHelpers
  module ConversionHelper
    #
    # Converts the obj to an Array. If copy is set to true
    # a copy of obj will be made if necessary.
    #
    def convert_to_array(obj, copy = false) # :nodoc:
      case obj
      when Array
        copy ? obj.dup : obj
      when Vector
        obj.to_a
      else
        begin
          converted = obj.to_ary
        rescue Exception => e
          raise TypeError, "can't convert #{obj.class} into an Array (#{e.message})"
        end
        raise TypeError, "#{obj.class}#to_ary should return an Array" unless converted.is_a? Array
        converted
      end
    end
    private :convert_to_array

    #
    # Converts the obj to Hash. If copy is set to true
    # a copy of obj will be made if necessary.
    #
    def convert_to_hash(obj, copy = false) # :nodoc:
      case obj
      when Hash
        copy ? obj.dup : obj
      when Array
        h = {}
        obj.each_with_index do |j,i|
          h[i] = j unless j == 0 || j.nil?
        end
        h
      when Vector
        h = {}
        obj.to_a.each_with_index { |j,i| h[i] = j unless j == 0 || j.nil? }
        h
      else
        raise "NOT IMPLEMENTED"
        # begin
        #   converted = obj.to_ary
        # rescue Exception => e
        #   raise TypeError, "can't convert #{obj.class} into an Array (#{e.message})"
        # end
        # raise TypeError, "#{obj.class}#to_ary should return an Array" unless converted.is_a? Array
        # converted
      end
    end

    #
    # Converts an array into a hash dropping all of the 0 elements
    #
    def convert_array_to_sparse_hash
      h = Hash.new(0)
      obj.to_a.each_with_index { |j,i| h[i] = j unless j == 0 }
      h
    end

    private :convert_to_hash, :convert_array_to_sparse_hash
	end
end