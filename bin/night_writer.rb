require 'pry'
require '../lib/night_writer/letter_definitions'
require '../lib/night_writer/file_functions'


reader = FileReader.new
text = reader.read_file.chomp
reader.identify_text(text)
if reader.texttype == "Latin"
  puts "we have found latin"
  latin = LatinConvert.new(text, reader.outfile)
  latin.latin_convert
elsif reader.texttype == "Braille"
  puts "we found braille"
  braille = BrailleConvert.new(reader.infile, reader.outfile)
  braille.braille_convert
end
