require 'rubygems'
require 'tap/test/unit'
require 'ms/testdata'

class TestdataTest < Test::Unit::TestCase
  include Tap::Test::Utils
  
  def test_dereference
    source_dir = File.expand_path("#{File.dirname(__FILE__)}/testdata")
    ref_document = "#{Ms::TESTDATA}/test/document.txt"
    doc_a = "#{source_dir}/test/document.txt"
    doc_b = "#{source_dir}/name.txt"
    
    document = File.read(ref_document)
    assert_equal "These are the contents of the reference document.", document
    
    #
    # Before dereference, the files simply
    # reference the test document.
    #
    
    assert !File.exists?(doc_a)
    assert !File.exists?(doc_b)
    assert_equal "",  File.read("#{doc_a}.ref")
    assert_equal "test/document.txt", File.read("#{doc_b}.ref")

    #
    # Within the dereference block, the referenece files
    # under the source directory are replaced with copies
    # of corresponding files under the reference directory 
    # (Ms::TESTDATA).
    #
    
    dereference(source_dir, Ms::TESTDATA) do
      assert_equal document, File.read(doc_a)
      assert_equal document, File.read(doc_b)
      
      assert !File.exists?("#{doc_a}.ref")
      assert !File.exists?("#{doc_b}.ref")
    end
    
    #
    # After dereference, the reference files
    # are restored.
    #
      
    assert !File.exists?(doc_a)
    assert !File.exists?(doc_b)
    assert_equal "",  File.read("#{doc_a}.ref")
    assert_equal "test/document.txt", File.read("#{doc_b}.ref")
  end
end