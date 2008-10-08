module MiniFacet::Split
  # Returns two hashes. The first contains all pairs for which the block evaluated to true,
  # the second contains all the others.
  def split(&block)
    trues, falses = self.class.new, self.class.new
    each_pair do |k,v| 
      if yield(k,v) 
        trues[k] = v
      else
        falses[k] = v
      end
    end
    #each_pair{ |k,v| (yield(k,v) ? trues : falses)[k] = v }
    return trues, falses
  end
end


Hash.send :include, MiniFacet::Split
