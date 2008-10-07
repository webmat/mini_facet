module PolishRuby
  module IncludesAll
    def includes_all?(*ary)
      ary = ary.flatten if ary.length == 1 && ary.first.is_a?(Array)
      # & is intersection
      (self & ary) == ary
    end
    
    alias :include_all? :includes_all? #Replicating Ruby's typos
  end
  
  Array.send :include, IncludesAll
end
