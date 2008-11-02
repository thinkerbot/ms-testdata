Gem::Specification.new do |s|
  s.name = "ms-testdata"
  s.version = "0.0.1"
  s.authors = ["John Prince", "Simon Chiang"]
  s.email = "simon.a.chiang@gmail.com"
  s.homepage = "http://rubyforge.org/projects/mspire/"
  s.platform = Gem::Platform::RUBY
  s.summary = "A repository of test data used by the mspire libraries."
  s.require_path = "lib"
  #s.test_file = "test/tap_test_suite.rb"
  s.rubyforge_project = "mspire"
  #s.has_rdoc = true
  s.add_dependency("tap", "~> 0.11")
  
  # list extra rdoc files like README here.
  s.extra_rdoc_files = %W{
    README
  }
  
  # list the files you want to include here. you can
  # check this manifest using 'rake :print_manifest'
  s.files = %W{
    lib/ms/testdata.rb
    testdata/ascii/SE_Leu
  }
end