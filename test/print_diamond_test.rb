require 'minitest/autorun'
require 'print_diamond'

class String
  def unindent
    gsub /^#{scan(/^[ \t]*\b/).min}/,''
  end
end

class TestPrintDiamond < MiniTest::Unit::TestCase
  include PrintDiamond

  def test_print_a
    assert_equal 'A', print_diamond('A')
  end

  def test_print_b
    expected = <<-END.unindent.chomp
     A 
    B B
     A 
    END
    assert_equal expected, print_diamond('B')
  end
end
