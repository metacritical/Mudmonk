require 'gserver'

class BasicServer < GServer 
	def serve(io)
		loop do
			io.print "~> "
			io.puts eval io.readline rescue NoMethodError
		end
	end
end

server = BasicServer.new(1984)
server.audit = true
server.start
server.join 
sleep 50
server.shutdown