module PolishRuby; end

Dir["#{ File.dirname(__FILE__) }/polish_ruby/*.rb"].each do |file|
  require file
end
