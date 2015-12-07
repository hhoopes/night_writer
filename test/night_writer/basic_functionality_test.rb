require 'minitest/autorun'
require 'night_writer/file_functions'
require 'night_writer/night_writer'
require 'night_writer/latin_convert'
require 'night_writer/braille_convert'

test_nightwriter= NightWriter.new

class BasicFunctionality_Test < Minitest::Test


  def test_file_reads
    skip
  end

  def test_handles_arguments

    skip
  end

  def test_identifies_language_as_Braille

    string = "00.00.."
    id = test_nightwriter.identify_text(string)
    assert_equal id, "Braille"
  end

  def test_translates_eng_to_brail
    skip
  end

  def test_translates_brail_to_eng
    skip
  end

end
