require "#{ File.dirname(__FILE__) }/../test_helper"

class HashSplitTest < Test::Unit::TestCase
  def setup
    super
    @h = {
      :bob => 'Marley',
      :mom => 'Barley',
      :gods => 'Harley',
      :chris => 'Farley'
    }
  end
  
  context "split" do
    should "return two hashes" do
      assert_kind_of Hash, (@h.split{|k,v| false})[0]
      assert_kind_of Hash, (@h.split{|k,v| false})[1]
    end
    context "splits the values" do
      setup do
        @first, @second = @h.split{|k,v| k.to_s.length == 3}
      end
      should "putting all pairs evaluating to true in the first one" do
        assert_equal( {:bob => 'Marley', :mom => 'Barley'}, @first)
      end
      should "putting all pairs evaluating to false in the second one" do
        assert_equal( {:gods => 'Harley', :chris => 'Farley'}, @second)
      end
    end
  end
end
