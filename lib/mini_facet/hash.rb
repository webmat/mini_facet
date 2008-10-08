Dir["#{ File.dirname(__FILE__) }/hash/*.rb"].each do |file|
  require file
end
