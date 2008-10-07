require 'rubygems'
require 'test/unit'
require 'shoulda'

#Optional
require 'ruby-debug'
require 'redgreen' unless ENV['TM_DIRECTORY'] #Don't load redgreen if running from TextMate

$TEST_DIR = File.expand_path(File.dirname(__FILE__))
