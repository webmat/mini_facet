module MiniFacet; end

Dir["#{ File.dirname(__FILE__) }/mini_facet/*.rb"].each do |file|
  require file
end
