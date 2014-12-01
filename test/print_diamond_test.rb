require 'minitest/autorun'
require 'print_diamond'

class TestPrintDiamond < MiniTest::Unit::TestCase
  include PrintDiamond

  def test_print_a
    assert_equal 'A', print_diamond('A')
  end
end
