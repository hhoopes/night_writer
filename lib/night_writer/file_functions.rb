require 'pry'                     # => true, false
require_relative 'braille_convert'
require_relative 'latin_convert'  # => false, true

class FileReader
  attr_reader :infile, :file_length, :outfile, :texttype, :opened_outfile  # => nil, nil

  def initialize
    @infile = ARGV[0]
    @file_length = @infile.length
    @outfile = ARGV[1]
    @texttype = ""
  end                              # => :initialize, :initialize

  def read_file
    File.read(@infile)
  end                   # => :read_file, :read_file

  def identify_text(any_text)
    uniques = any_text.chars.to_a.uniq
    if uniques.length <= 3 && /\.|0/.match(uniques.to_s)
      @texttype = "Braille"
    else @texttype = "Latin"
    end
  end                                                             # =                     # => :open_outfile                   # => :write_outfile
end                            # => :identify_text, :identify_text
