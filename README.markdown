MiniFacet
=========

This is a small library to add a few basic niceties to Ruby. It's not meant to 
be all-encompassing and include tons of things like Ruby Facets, however.


Example
=======

    require 'mini\_facet'
    # Will include everything
    # Including piece by piece is coming, but is not yet done
    
    Right now, mini\_facet only adds the following:
    Hash#extract([])      #=> Hash
    Hash#extract(&block)  #=> Hash
    Hash#extract(proc)    #=> Hash
    Hash#split(&block)    #=> Hash(block true), Hash(block false)
    Hash#split(proc)      #=> Hash(proc true), Hash(proc false)
    Array#count_distinct
    Array#includes_all? #and include_all?


Copyright (c) 2008 Mathieu Martin, released under the MIT license
