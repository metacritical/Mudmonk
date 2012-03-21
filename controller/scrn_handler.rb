require 'observer'
require './controller/keyb_handler'

ROWS    = 80
COLUMNS = 120

class InitScreen
  include Observable
  attr_accessor :cursor  

  def initialize
    KeyboardHandler.new
    #SyntaxParser.new
  end

  def run
    @screen_area = [[],[]]
  end
end
