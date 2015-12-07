require_relative 'letter_definitions'
require 'pry'
require_relative 'file_functions'

class BrailleConvert
  def initialize(infile, outputfile)
    @infile = infile
    @outputfile = outputfile
  end

  def braille_convert
    array = File.open(@infile).readlines
    array.each { |s| s.chomp! }
    output = File.open(@outputfile, "w")
    until array.length == 0
      new_line = ""
      row1, row2, row3 = array.shift, array.shift, array.shift
      until row3.length == 0
        value_var = ""
        value_var << row1.slice!(0..1)
        value_var << row2.slice!(0..1)
        value_var << row3.slice!(0..1)

        value = value_var.split(//)

        # error checking in case there's no key
        # add else case 
        if LETTERS.has_value?(value)
          new_line << LETTERS.key(value)
        end

      end
      output.write(new_line)
    end
    output.close
  end
end
