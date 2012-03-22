class KeyboardHandler
  def initialize(io)
    @io = io
  end

  def read_data
    character = @io.bytes.each do |i|
      i.to_s(16)
    end
  end

  def run
    loop do
      #character = @io.getbyte.to_s(16)
      char_data = read_data

      case char_data
      when "1b" #<esc> Character
        @io.print "\x8\x8"
        @io.print "Shorel 'aran\n"
        $monkserver.stop
                
#      when "41" #"A"
#        @io.print "\x8"
#        @io.print "B"
#        #io.print "\x1b\x238" #Repeat E on screen
#        
#      when "8" #"C-h" combination keypress
#        @io.print "\x8\x8"
#        @io.puts "Help commands : blah..blah.."
#        @io.print "\n~> "
#
#      when "7f"
#        @io.print "\x8\x8\x8"
#        
#      when "\e"
#        @io.print "Da..Da..da.da..da"
#        
      else
      @io.print char_data
      end
    end
  end
end
