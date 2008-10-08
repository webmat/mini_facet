require "#{ File.dirname(__FILE__) }/../test_helper"

class ArrayIncludesAllTest < Test::Unit::TestCase
  def self.test_includes_all(options)
    context "#{ options[:array].inspect }.includes_all?(#{ options[:includes_all?].inspect })" do
      should "return #{options[:returns]}" do
        assert_equal options[:returns], options[:array].includes_all?(options[:includes_all?])
      end
    end
  end
  
  test_includes_all :array => [],             :includes_all? => [], :returns => true          # Same as Ruby's Set
  test_includes_all :array => [],             :includes_all? => [:a], :returns => false
                                              
  test_includes_all :array => [:a],           :includes_all? => [], :returns => true          # Same as Ruby's Set
  test_includes_all :array => [:a],           :includes_all? => [:a], :returns => true
  test_includes_all :array => [:a],           :includes_all? => [:a, :a], :returns => false
  test_includes_all :array => [:a, :a],       :includes_all? => [:a], :returns => true
  #test_includes_all :array => [:a, :a],       :includes_all? => [:a, :a], :returns => true
  
  test_includes_all :array => [:a, :b],       :includes_all? => [:a], :returns => true
  test_includes_all :array => [:a, :b],       :includes_all? => [:a, :b], :returns => true
  test_includes_all :array => [:a, :b],       :includes_all? => [:b, :a], :returns => true
  
  test_includes_all :array => [[:a], [:b]],   :includes_all? => [[:a]], :returns => true
  test_includes_all :array => [[:a], [:b]],   :includes_all? => [[:a], [:b]], :returns => true
  
  test_includes_all :array => [[:a], [:b]],   :includes_all? => [:a, :b], :returns => false
  test_includes_all :array => [[:a, :b]],     :includes_all? => [:a, :b], :returns => false
  test_includes_all :array => [:a, :b],       :includes_all? => [[:a, :b]], :returns => false
end
