require 'observer'
require './controller/keyb_handler'

class InitScreen
  def initialize
    KeboardHandler.new
    SyntaxParser.new
  end

  def run
    
  end
end
