require './controller/mudserve'
#require './controller/scrn_handler'

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
      sleep 0.05
    end

    print io.methods.sort #methods to use
    io.puts "Bal'a dash, Malanore" #msg send to telnet client
    io.print "\377\373\3" # send IAC WILL SUPPRESS-GOAHEAD
    #io.print "\377\375\3" # send IAC DO SUPPRESS-GO-AHEAD
    #io.puts "\e[32;36r" #cursor scroll at 32;36
    io.print "\n~> "
    loop do
      character = io.getbyte.to_s(16)
      
      if character == "1b"  #mode switch Alt + `
        io.print "\x8\x8"
        io.print "Shorel 'aran\n"
        self.stop
      else
        if character == '41'
          io.print "\x8"
          io.print 'B'
          #io.print "\x1b\x238" #Repeate E on screen
        end
      end
    end
  end
end

monkserver = MonkServer.new(PORT_NO)
monkserver.audit = true
monkserver.start
monkserver.join
#monkserver.shutdown
#MonkServer.stop 8081
#self.stop
