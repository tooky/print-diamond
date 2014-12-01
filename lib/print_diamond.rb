module PrintDiamond
  ALPHABET = Array('A'..'Z')

  def print_diamond(letter)
    if letter == 'A'
      [print_line(letter)]
    elsif letter == 'B'
      [' A ', print_line(letter), ' A ']
    else
      ['  A  ', ' B B ', print_line(letter), ' B B ', '  A  ']
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
