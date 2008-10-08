module MiniFacet::IncludesAll
  def includes_all?(ary)
    our_count   = self.count_distinct
    their_count = ary.count_distinct
    
    their_count.each_pair do |k,v|
      our_v = our_count[k]
      return false if our_v.nil? || our_v < v
    end
    return true
  end
  
  alias :include_all? :includes_all? #Replicating Ruby's typos
end


Array.send :include, MiniFacet::IncludesAll
