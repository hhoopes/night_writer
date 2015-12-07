require_relative 'letter_definitions'
require 'pry'
require_relative 'file_functions'

class LatinConvert

  def initialize(any_text, file)
    @any_text = any_text
    @file = file
    @buffer1 = ""
    @buffer2 = ""
    @buffer3 = ""
  end

  def write_buffer(file)
    # append so I don't overwrite my file later
    File.open(file, 'a') do |f|
      f.write("#{@buffer1}\n#{@buffer2}\n#{@buffer3}\n")
    end
  end

  def latin_convert
    # truncate in case there's a leftover file
    File.open(@file, 'w').truncate(0)
    @any_text.each_char do | char |
      if LETTERS[char].has_value?
        @buffer1 << LETTERS[char][0]
        @buffer1 << LETTERS[char][1]
        @buffer2 << LETTERS[char][2]
        @buffer2 << LETTERS[char][3]
        @buffer3 << LETTERS[char][4]
        @buffer3 << LETTERS[char][5]

      # add else case for errors
      end
      if @buffer1.size == SCREENWIDTH
        write_buffer(@file)
        clear_buffer
      end
    end
    write_buffer(@file)
    clear_buffer
  end

    def clear_buffer
      @buffer1.clear
      @buffer2.clear
      @buffer3.clear
    end
end
