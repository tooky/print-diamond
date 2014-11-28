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

  def test_print_c
    expected = <<-END.unindent.chomp
      A  
     B B 
    C   C
     B B 
      A  
    END
    assert_equal expected, print_diamond('C')
  end

  def test_print_h
    expected = <<-END.unindent.chomp
           A       
          B B      
         C   C     
        D     D    
       E       E   
      F         F  
     G           G 
    H             H
     G           G 
      F         F  
       E       E   
        D     D    
         C   C     
          B B      
           A       
    END
    assert_equal expected, print_diamond('H')
  end
end
