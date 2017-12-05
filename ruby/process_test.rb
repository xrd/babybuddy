require 'test/unit'
require './processor'

class ProcessorTest < Test::Unit::TestCase
  @processor = nil
  
  def setup
    file = File.read( "./sample.json" )
    @processor = Processor.new( file )
   end

  # def teardown
  # end

  def test_fail
    assert(@processor.action, "eat" )
    assert(@processor.amount, "4" )
  end
end
