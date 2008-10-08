require 'rubygems'

require 'rake'

HERE = File.dirname(__FILE__)
windows = (RUBY_PLATFORM =~ /win32|cygwin/) rescue nil
SUDO = windows ? "" : "sudo"

require "#{HERE}/lib/mini_facet"
Dir['tasks/**/*.rake'].each { |rake| load rake }

desc 'Default: run all tests.'
task :default => :test

