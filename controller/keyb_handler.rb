class KeyboardHandler
  def initialize(io)
    @io = io
  end

  def read_data
    multi_bytes = @io.bytes.each do |i|
      i.to_s(16)
    end
  end

  def run
    loop do
      character = @io.getbytes.to_s(16)
      #multi_bytes = @io.bytes.each {|i| i.to_s(16) }

    case character
     when "11" #C-q KeyCombo
     @io.print "\x8\x8"
     @io.print "\nShorel 'aran\n"
     $monkserver.stop
               
     when "41" #"A" Character
       @io.print "\x8"
       @io.print "B"
       #@io.print "\x1b\x238" #Repeat E on screen
       
     when "8" #"C-h" combination keypress
       @io.print "\x8\x8"
       @io.puts "Help commands : blah..blah.."
       @io.print "\n~> "
   
     when "7f" #Backspace
       @io.print "\x8\x8\x8"
       
      else
      #character = @io.bytes.each {|i| i.to_s(16) }
      
      #case multi_character
      #  when "1b5b337e"
      #@io.print read_data
      @io.print character + "-"
      end
    end
  end
end
