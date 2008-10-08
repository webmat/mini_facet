MiniFacet
=========

This is a small library to add a few basic niceties to Ruby. It's not meant to 
be all-encompassing and include tons of things like Ruby Facets, however.


Example
=======

    require 'mini_facet'
    # Will include everything
    # Including piece by piece is coming, but is not yet done
    
    Right now, mini_facet only adds the following:
    Hash#extract([])        #=> Hash
    Hash#extract(&block)    #=> Hash
    Hash#extract(proc)      #=> Hash
    Hash#split(&block)      #=> Hash(block true), Hash(block false)
    Hash#split(proc)        #=> Hash(proc true), Hash(proc false)
    Array#count_distinct    #=> Hash with the count of each element, e.g. [:a, :a] => {:a => 2}
    Array#includes_all?([]) #=> true/false
    Array#include_all?      #Just replicating Ruby's typos ;-)


Copyright (c) 2008 Mathieu Martin, released under the MIT license
