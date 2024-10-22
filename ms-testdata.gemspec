Gem::Specification.new do |s|
  s.name = "ms-testdata"
  s.version = "0.1.0"
  s.authors = ["John Prince", "Simon Chiang"]
  s.email = "simon.a.chiang@gmail.com"
  s.homepage = "http://rubyforge.org/projects/mspire/"
  s.platform = Gem::Platform::RUBY
  s.summary = "A repository of test data used by the mspire libraries."
  s.require_path = "lib"
  s.rubyforge_project = "mspire"
  s.add_dependency("tap-test", ">= 0.1.0")
  
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