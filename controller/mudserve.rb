#!/usr/bin/ruby -w
require 'logger'
require 'gserver'

SERVER_NAME = 'Genesis'
PORT_NO = 8081
MonkServerName = "MUDMonk Server '#{SERVER_NAME}'"
MudMonkVersion = "v0.0.1"
HELP = "Type: <esc> 'help?' for a list of commands"

class MUDServe < GServer
	#Start Logger
	def start_logger
		log = Logger.new('log/monkserver.log','daily')
		log.level = Logger::WARN
	end
		
	#Close Client connection
	def quit
		io.puts "Shorel'aran"
		exit #Just for method display sake.
	end
	
	#Draw Monk pic
	def draw_monk
		monk_pic = File.read('views/ascii_monk.pic').split(/\n/)
		#FG Red (\e[31m) and BG Blue (\e[44m).
		out ||= [] << "\e[44m\e[31mWelcome to #{MonkServerName} #{MudMonkVersion}\n\e[0m"
		out << HELP
		out << "\n"
		out << "\e[31m" #red color
		for eachline in monk_pic do
			out << eachline + "\n"
		end
		out << "\e[0m" #reset color
		out
	end
	
	##############################
	# Find Current cursor position
	##############################
	
	def find_cur_position
		"\e[6n  \e[c  \e[0c" 
	end
end
