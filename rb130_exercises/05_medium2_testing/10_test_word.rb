=begin
Recall that in the last exercise we only had to test one method of our Text 
class. One of the useful facets of the setup and teardown methods is that they 
are automatically run before and after each test respectively. To show this we'll 
be adding one more method to our Text class, word_count.

Write a test for this new method. Make sure to utilize the setup and teardown 
methods for any file related operations.
=end

=begin
  setup
    - open textfile '08_sample_text.txt'
  
  test
    - initialize instance of Text, r
      - ead text file
=end

require 'minitest/autorun'
require_relative '08_text_class'

class WordCountTest < MiniTest::Test
  def setup
    @file = File.open('08_sample_text.txt')
    @text = Text.new(@file.read)
  end
  
  def test_swap
    actual_text = @text.swap('a', 'e')
    expected_text = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT

    assert_equal(actual_text, expected_text)
  end

  def test_word_count
    assert_equal(72, @text.word_count)
  end

  def teardown
    @file.close
  end

end

