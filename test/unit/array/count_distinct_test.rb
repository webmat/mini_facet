require "#{ File.dirname(__FILE__) }/../test_helper"

class ArrayExtensionsTest < Test::Unit::TestCase
  context "Array#count_distinct" do
    should "work with empty arrays" do
      assert_equal({}, [].count_distinct)
    end
    
    should "calculate the sums correctly" do
      assert_equal({:key => 2, 'key2' => 1}, [:key, 'key2', :key].count_distinct)
    end
    
    should "support and count nil elements" do
      assert_equal({:key => 2, nil => 3}, [nil, :key, nil, nil, :key].count_distinct)
    end
    
    should "filter out elements with a low count based on purge_smaller_than" do
      assert_equal({:key => 2}, [:key, 'key', nil, :key].count_distinct(2))
    end
  end
end
