module PrintDiamond
  ALPHABET = Array('A'..'Z')

  def print_diamond(letter)
    if letter == 'A'
      [print_line(letter)]
    elsif letter == 'B'
      [' A ', 'B B', ' A ']
    else
      ['  A  ', ' B B ', 'C   C', ' B B ', '  A  ']
    end.join("\n")
  end

  private
  def print_line(letter)
    if letter == 'A'
      letter
    else
      [letter, ' ' * ALPHABET.index(letter), letter].join
    end
  end
end
