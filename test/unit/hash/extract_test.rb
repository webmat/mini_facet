require "#{ File.dirname(__FILE__) }/../test_helper"

class HashExtractTest < Test::Unit::TestCase
  def setup
    super
    @h = {
      :bob => 'Marley',
      :mom => 'Barley',
      :gods => 'Harley',
      :chris => 'Farley'
    }
  end
  
  context "extract" do
    context "with a block" do
      
      should "return all elements for which the block evaluates to a true value" do
        assert_equal( {:bob => 'Marley', :mom => 'Barley'}, @h.extract{ |k, v| v =~ /\A[M|B]/ })
      end
      
      should "ignore the args and go with the block" do
        assert_equal( {:bob => 'Marley', :mom => 'Barley'}, @h.extract([:gods]){ |k, v| v =~ /\A[M|B]/ })
      end
    end
    
    should "accept a proc as a normal parameter" do
      proc = Proc.new { |k, v| v =~ /\A[M|B]/ }
      assert_equal( {:bob => 'Marley', :mom => 'Barley'}, @h.extract(proc))
    end
    
    should "accept a lambda as a normal parameter" do
      l = lambda { |k, v| v =~ /\A[M|B]/ }
      assert_equal( {:bob => 'Marley', :mom => 'Barley'}, @h.extract(l))
    end
  end
  
  def test_normal
    assert_equal( {:bob => 'Marley'}, @h.extract([:bob]) )
    assert_equal( {:mom => 'Barley', :bob => 'Marley'}, @h.extract([:bob, :mom]) )
    
    all_keys = @h.extract [:bob, :mom, :gods, :chris]
    assert_not_equal( all_keys.object_id, @h.object_id )
  end
  
  def test_normal_alternative
    assert_equal( {:bob => 'Marley'}, @h.extract([:bob]) )
    assert_equal( {:mom => 'Barley', :bob => 'Marley'}, @h.extract([:bob, :mom]) )
    
    all_extracted = @h.extract([:bob, :mom, :gods, :chris])
    assert_not_equal( all_extracted.object_id, @h.object_id )
  end
  
  def test_edge_case
    assert_equal( {}, @h.extract([]) )
    assert_equal( @h, @h.extract([:bob, :mom, :gods, :chris]) )
  end
  
  def test_unknown_key
    assert_equal( {}, @h.extract([:ahem]) )
    assert_equal( {:bob => 'Marley'}, @h.extract([:bob, :ahem]) )
    assert_equal( {}, @h.extract(['some other type of key']) )
  end
  
  def test_keep_nil_value_in_hash
    #Yes, h2 as in Hummer :-)
    h2 = {:price => 'expensive', :sex_appeal => nil}
    assert_equal( h2, h2.extract([:sex_appeal, :price]) )
  end
  
  class CustomTestHash < Hash; end
  def test_something_else_than_hash_is_extractable
    m=CustomTestHash.new.merge({:a=>:b,:c=>:d})
    n=m.extract([:a])
    assert_kind_of CustomTestHash, n
    assert_equal( CustomTestHash.new.merge({:a=>:b}), n )
  end
end
