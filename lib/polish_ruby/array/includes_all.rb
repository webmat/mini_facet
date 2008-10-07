module PolishRuby
  module IncludesAll
    def includes_all?(ary)
      # & is intersection
      (self & ary) == ary
    end
    
    alias :include_all? :includes_all? #Replicating Ruby's typos
  end
  
  Array.send :include, IncludesAll
end
