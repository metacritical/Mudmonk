require 'observer'
require './controller/keyb_handler'

class InitScreen
  include Observable

  def initialize
    KeboardHandler.new
   #SyntaxParser.new
  end

  def run
    
  end
end
