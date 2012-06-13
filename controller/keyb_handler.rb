require_relative '../controller/commands_module'

class KeyboardHandler
  include Commands
  
  def initialize(io)
    @io = io
  end
  
  def read_data
    multi_bytes = @io.bytes.each do |i|
      i.to_s(16)
    end
  end
  
  def io_print p_str
    @io.print p_str
  end
  
  def io_puts str
    @io.puts str
  end

  
  def run
    loop do
      character = @io.getbyte.to_s(16)
      #multi_bytes = @io.bytes.each {|i| i.to_s(16) }
      
      case character
        
        ###################
        #Capital Aplhabets#
        ###################
        
      when "41" #"A" Character
        io_print "\x8"+"A"
        
      when "42" #"B" Character
        io_print "\x8"+"B"
        
      when "43" #"C" Character
        io_print "\x8"+"C"
        
      when "44" #"D" Character
        io_print "\x8"+"D"

      when "45" #"E" Character
        io_print "\x8"+"E"

      when "46" #"F" Character
        io_print "\x8"+"F"

      when "47" #"G" Character
        io_print "\x8"+"G"

      when "48" #"H" Character
        io_print "\x8"+"H"

      when "49" #"I" Character
        io_print "\x8"+"I"

      when "4a" #"J" Character
        io_print "\x8"+"J"

      when "4b" #"K" Character
        io_print "\x8"+"K"

      when "4c" #"L" Character

        io_print "\x8"+"L"

      when "4d" #"M" Character
        io_print "\x8"+"M"

      when "4e" #"N" Character
        io_print "\x8"+"N"

      when "4f" #"O" Character
        io_print "\x8"+"O"

      when "50" #"P" Character
        io_print "\x8"+"P"

      when "51" #"Q" Character
        io_print "\x8"+"Q"

      when "52" #"R" Character
        io_print "\x8"+"R"

      when "53" #"S" Character
        io_print "\x8"+"S"

      when "54" #"T" Character
        io_print "\x8"+"T"

      when "55" #"U" Character
        io_print "\x8"+"U"

      when "56" #"V" Character
        io_print "\x8"+"V"

      when "57" #"W" Character
        io_print "\x8"+"W"

      when "58" #"X" Character
        io_print "\x8"+"X"

      when "59" #"Y" Character
        io_print "\x8"+"Y"

      when "5a" #"Z" Character
        io_print "\x8"+"Z"

#################
#Small Alphabets#
#################

      when "61" #"a" Character
        io_print "\x8"+"a"

      when "62" #"b" Character
        io_print "\x8"+"b"

      when "63" #"c" Character
        io_print "\x8"+"c"

      when "64" #"d" Character
        io_print "\x8"+"d"

      when "65" #"e" Character
        io_print "\x8"+"e"

      when "66" #"f" Character
        io_print "\x8"+"f"

      when "67" #"g" Character
        io_print "\x8"+"g"

      when "68" #"h" Character
        io_print "\x8"+"h"

      when "69" #"i" Character
        io_print "\x8"+"i"

      when "6a" #"j" Character
        io_print "\x8"+"j"

      when "6b" #"k" Character
        io_print "\x8"+"k"

      when "6c" #"l" Character
        io_print "\x8"+"l"

      when "6d" #"m" Character
        io_print "\x8"+"m"

      when "6e" #"n" Character
        io_print "\x8"+"n"

      when "6f" #"o" Character
        io_print "\x8"+"o"

      when "70" #"p" Character
        io_print "\x8"+"p"

      when "71" #"q" Character
        io_print "\x8"+"q"

      when "72" #"r" Character
        io_print "\x8"+"r"

      when "73" #"s" Character
        io_print "\x8"+"s"

      when "74" #"t" Character
        io_print "\x8"+"t"

      when "75" #"u" Character
        io_print "\x8"+"u"

      when "76" #"v" Character
        io_print "\x8"+"v"

      when "77" #"w" Character
        io_print "\x8"+"w"

      when "78" #"x" Character
        io_print "\x8"+"x"

      when "79" #"y" Character
        io_print "\x8"+"y"

      when "7a" #"z" Character
        io_print "\x8"+"z"

############
#Key Combos#
############

      when "11" #C-q KeyCombo
        io_print "\x8\x8"
        io_print "\nShorel 'aran\n"
        $monkserver.stop
        # @io.print "\x1b\x238" #Repeat E on screen 

      when "8" #"C-h" combination keypress
        io_print "\x8\x8"
        io_puts "Help commands : blah..blah.."
        io_print "\n~> "+"\x8"
        
      when "7f" #Backspace
        io_print "\x8\x8\x8"
          
      when "4" #Delete  #C-d
        io_print "\x8\x8 Hey Delete"


##########################
#Numeric keys and symbols#
##########################
        
      when "31" #Numeric 1
        io_print "\x8" + "1"
        
      when "32" #Numeric 2
        io_print "\x8" + "2"
        
      when "33" #Numeric 3
        io_print "\x8" + "3"
        
      when "34" #Numeric 4
        io_print "\x8" + "4"

      when "35" #Numeric 5
        io_print "\x8" + "5"

      when "36" #Numeric 6
        io_print "\x8" + "6"

      when "37" #Numeric 7
        io_print "\x8" + "7"

      when "38" #Numeric 8
        io_print "\x8" + "8"

      when "39" #Numeric 9
        io_print "\x8" + "9"

      when "30" #Numeric 0
        io_print "\x8" + "0"

      when "2d" #Symbols '-'
        io_print "\x8" + "-"

      when "3d" #Symbols '='
        io_print "\x8" + "="

      when "5c" #Symbols '\'
        io_print "\x8" + "\\"

      when "21" #Symbols '!'
        io_print "\x8" + "!"

      when "40" #Symbols '@'
        io_print "\x8" + "@"

      when "23" #Symbols '#'
        io_print "\x8" + "#"

      when "24" #Symbols '$'
        io_print "\x8" + "$"

      when "25" #Symbols '%'
        io_print "\x8" + "%"

      when "5e" #Symbols '^'
        io_print "\x8" + "^"

      when "26" #Symbols '&'
        io_print "\x8" + "&"

      when "2a" #Symbols '*'
        io_print "\x8" + "*"

      when "28" #Symbols '('
        io_print "\x8" + "("

      when "29" #Symbols ')'
        io_print "\x8" + ")"

      when "5f" #Symbols '_'
        io_print "\x8" + "_"

      when "2b" #Symbols '+'
        io_print "\x8" + "+"

      when "7c" #Symbols '|'
        io_print "\x8" + "|"

      when "7b" #Symbols '{'
        io_print "\x8" + "{"

      when "7d" #Symbols '}'
        io_print "\x8" + "}"

      when "3a" #Symbols ':'
        io_print "\x8" + ":"

      when "22" #Symbols '"'
        io_print "\x8" + "\""

      when "3c" #Symbols '<'
        io_print "\x8" + "<"

      when "3e" #Symbols '>'
        io_print "\x8" + ">"

      when "3f" #Symbols '?'
        io_print "\x8" + "?"

      when "7e" #Symbols '~'
        io_print "\x8" + "~"

      when "60" #Symbols '`'
        io_print "\x8" + "`"

      when "10" #Symbols 'UP'
        io_print key_up
       
      when "e" #Symbols 'DOWN'
        io_print key_down
       
      when "6" #Symbols 'BACKWARD'
        io_print key_left
       
      when "2" #Symbols 'FORWARD"
        io_print key_right
       
      else
        #byte_array ||= [] << character.each_byte {|i| i.to_s(16)}
        io_print character + "\x8\x8"
      end
    end
  end
end
