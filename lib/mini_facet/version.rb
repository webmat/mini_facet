module MiniFacet
  module VERSION
    MAJOR    = 0
    MINOR    = 0
    TINY     = 1
    
    STRING   = [MAJOR, MINOR, TINY].join('.').freeze
  end
  
  NAME          = 'mini_facet'.freeze
  COMPLETE_NAME = "#{NAME} #{VERSION::STRING}".freeze  
end
