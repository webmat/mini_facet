module MiniFacet
  LIB_DIR = File.expand_path(File.dirname(__FILE__))
end

Dir["#{ MiniFacet::LIB_DIR }/mini_facet/*.rb"].each do |file|
  require file
end
