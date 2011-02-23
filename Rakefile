require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "ms-testdata"
  gem.homepage = "http://github.com/jtprince/ms-testdata"
  gem.license = "MIT"
  gem.summary = %Q{A repository of test data used by the mspire libraries}
  gem.description = %Q{The data used to test the mspire libraries is often large and unwieldly.  To better 
support multiple libraries, multiple developers, and the inevitable overlap of one
library test data with that of another, the mspire test data has been extracted
into this project.}
  gem.email = "jtprince@gmail.com"
  gem.authors = ["John T. Prince", "Simon Chiang"]
  gem.rubyforge_project = "mspire"
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |spec|
  spec.libs << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.verbose = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "ms-testdata #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
