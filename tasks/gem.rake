require 'yaml'

require 'rake/gempackagetask'

task :clean => :clobber_package

spec = Gem::Specification.new do |s|
  s.name                  = MiniFacet::NAME
  s.version               = MiniFacet::VERSION::STRING
  s.summary               = "Adding a few basic, useful things to Ruby."
  s.description           = "Adding a few basic, useful things to Ruby."

  s.authors               = ['Mathieu Martin']
  s.email                 = "webmat@gmail.com"
  s.homepage              = "http://github.com/webmat/mini_facet"
  s.rubyforge_project     = 'mini_facet'

  s.has_rdoc              = true
  
  s.test_files            = Dir['test/**/*'].reject{|f| f =~ /test\/my_test_helper.rb/}
  s.files                 = Dir['**/*'].reject{|f| f =~ /\Apkg|\Acoverage|\.gemspec\Z|test\/my_test_helper.rb/}
  
  s.require_path          = "lib"
end

#Creates clobber_package, gem, package and repackage tasks
Rake::GemPackageTask.new(spec) do |p|
  p.gem_spec = spec
end

TAG_COMMAND = "git tag -m 'Tagging version #{MiniFacet::VERSION::STRING}' -a v#{MiniFacet::VERSION::STRING}"
task :tag_warn do
  puts  "*" * 40,
        "Don't forget to tag the release:",
        '',
        "  " + TAG_COMMAND,
        '',
        "or run rake tag",
        "*" * 40
end
task :tag do
  sh TAG_COMMAND
end
task :gem => :tag_warn

namespace :gem do
  desc "Update the gemspec for GitHub's gem server"
  task :github do
    File.open("#{MiniFacet::NAME}.gemspec", 'w'){|f| f.puts YAML::dump(spec) }
    puts "gemspec generated here: #{MiniFacet::NAME}.gemspec"
  end
  
  desc 'Upload gem to rubyforge.org'
  task :rubyforge => :gem do
    sh 'rubyforge login'
    sh "rubyforge add_release mini_facet mini_facet '#{MiniFacet::VERSION::STRING}' pkg/#{spec.full_name}.gem"
    sh "rubyforge add_file mini_facet mini_facet #{MiniFacet::VERSION::STRING} pkg/#{spec.full_name}.gem"
  end
end

task :install => [:clean, :gem] do
  sh "#{SUDO} gem install pkg/#{spec.full_name}.gem"
end

task :uninstall do
  sh "#{SUDO} gem uninstall -v #{MiniFacet::VERSION::STRING} -x #{MiniFacet::NAME}"
end
