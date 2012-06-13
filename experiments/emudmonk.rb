require 'rubygems'
require 'eventmachine'
require_relative 'controller/commands'

module MudServer
  include Commands
  def post_init
    $SAFE = 2
    puts "-- someone connected to the Mudmonk server!"
    monk_pic = File.read('views/ascii_monk.pic')
    send_data "Welcome to MUDMonk\n"
    send_data "\e[31m"
    send_data monk_pic
    send_data "\e[0m\n"
    send_data "~> "
  end

  def receive_data data
    send_data "=> "
    begin
      #send_data data.methods
      send_data eval data
      raise SyntaxError
    rescue SyntaxError
    rescue NoMethodError
    rescue NameError
    rescue ArgumentError
    end
    send_data "\n~> "
  end

  def exit
    self.close_connection
    puts "-- someone was disconnected from Mudmonk server!"
  end
end

EventMachine::run {
  EventMachine::start_server "127.0.0.1", 8081, MudServer
  puts 'running Mudmonk server on 8081'
}
