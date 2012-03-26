require './controller/mudserve'
require './controller/scrn_handler'
require './controller/keyb_handler'

class MonkServer < MUDServe

  def initialize(port,*args)
    super(port,*args)
    start_logger
  end
			
  def serve(io)
    #Initialize Keyboard Handler
    
    #io.print "\377\373\31" #IAC DO NAWS
    puts "-- #{io.peeraddr} connected to the Mudmonk server!"
    for eachline in draw_monk do  
      io.puts eachline
      sleep 0.05 #just a little delay for animation like effect
    end

    puts io.methods.sort  #methods to use
    io.puts "Bal'a dash, Malanore" #msg send to telnet client
    io.print "\377\373\3" # send IAC WILL SUPPRESS-GOAHEAD
    #io.print "\e[?3" # Set number of columns to 132
    #io.print "\377\375\3" # send IAC DO SUPPRESS-GO-AHEAD
    #io.puts "\e[32;36r" #cursor scroll at 32;36
    io.print "\n~> "+"\e[4C\x8\x8"
    io.print ""
    KeyboardHandler.new(io).run
  end
end

$monkserver = MonkServer.new(PORT_NO)
$monkserver.audit = true
$monkserver.start
$monkserver.join

#keyb_handler = KeyboardHandler.new
#monkserver.shutdown
#MonkServer.stop 8081
#self.stop
