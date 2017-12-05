require 'json'

class Processor
  @file = nil
  @parsed = nil
  
  def initialize(_file)
    @file = _file
    @parsed = JSON.parse( _file )
  end

  def action
    @parsed['result']['action']
  end
  
  def time
    
  end

  def amount
    @parsed['result']['parameters']['unit-weight']['amount']
  end
  
end
