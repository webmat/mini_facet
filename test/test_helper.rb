require 'rubygems'
require 'test/unit'
require 'shoulda'

$TEST_DIR = File.expand_path(File.dirname(__FILE__))

require "#{$TEST_DIR}/my_test_helper" if File.exists?("#{$TEST_DIR}/my_test_helper.rb")
