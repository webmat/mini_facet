module MiniFacet::Extract
  # Hash#extract([keys]) => Hash
  # Hash#extract{|k,v| predicate } => Hash
  # Hash#extract(proc) => Hash
  # 
  # Returns a new Hash that contains only the k,v pairs where the k was
  # specified in the keys array.
  # If any k in keys is not present in the original Hash, it's simply
  # not the resulting Hash.
  # 
  # This is very useful to check that a Hash contains at least some desired keys
  # or to get a sanitized Hash out of the one we currently have.
  # 
  # Examples:
  #  h = {:bob=>'Marley',:mom=>'Barley'}
  #  h.extract([:bob])            #=> {:bob=>'Marley'}
  #  h.extract([:bob, :mom])      #=> {:bob=>'Marley',:mom=>'Barley'}
  #  h.extract([:sos])            #=> {}
  #
  #  h.extract{|k,v| v =~ /Mar/}  #=>{:bob=>'Marley}
  
  def extract(*args, &block)
    # Despide the *args, extract doesn't accept a splatted array.
    # It's really either an array or some form of block/proc.
    if block_given?
      extract_block(&block)
    elsif args[0].is_a? Proc
      extract_block(&args[0])
    elsif args[0].is_a? Array
      extract_keys(args[0])
    else
      raise ArgumentError, "extract requires either an array of keys, a block or a proc"
    end
  end
  
  private
    def extract_keys(keys)
      extracted = self.class.new #Can therefore be included in any hash-like container
      keys.each { |k| extracted[k] = self[k] if self.include?(k) }
      extracted
    end
    
    def extract_block(&block)
      extracted = self.class.new
      each_pair{ |k,v| extracted[k] = v if yield(k,v) }
      extracted
    end
end


Hash.send :include, MiniFacet::Extract
