require './controller/mudserve'
require './controller/scrn_handler'
require './controller/keyb_handler'

class MonkServer < MUDServe
  def initialize(port,*args)
    super(port,*args)
    start_logger
  end
			
  def serve(io)
    io.print "\377\373\31" #IAC DO NAWS
    puts "-- #{io.peeraddr} connected to the Mudmonk server!"
    for eachline in draw_monk do  
      io.puts eachline
      sleep 0.05 #just a little delay for animation like effect
    end

    print io.methods.sort #methods to use
    io.puts "Bal'a dash, Malanore" #msg send to telnet client
    io.print "\377\373\3" # send IAC WILL SUPPRESS-GOAHEAD
    #io.print "\e[?3" # Set number of columns to 132
    #io.print "\377\375\3" # send IAC DO SUPPRESS-GO-AHEAD
    #io.puts "\e[32;36r" #cursor scroll at 32;36
    io.print "\n~> "
    loop do
      character = io.getbyte.to_s(16)
      
      case character
      when "1b" #<esc> Character
        io.print "\x8\x8"
        io.print "Shorel 'aran\n"
        self.stop
        
      when "41" #"A"
        io.print "\x8"
        io.print "A"
        #io.print "\x1b\x238" #Repeat E on screen
        
      when "8" #"C-h" combination keypress
        io.print "\x8\x8"
        io.puts "Help commands : blah..blah.."
        io.print "\n~> "
        else 
        io.print character
      end
    end
  end
end

monkserver = MonkServer.new(PORT_NO)
monkserver.audit = true
monkserver.start
monkserver.join
initscreen = InitScreen.new
#keyb_handler = KeyboardHandler.new
#monkserver.shutdown
#MonkServer.stop 8081
#self.stop
