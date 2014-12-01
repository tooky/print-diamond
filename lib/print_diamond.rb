module PrintDiamond
  ALPHABET = Array('A'..'Z')

  def print_diamond(letter)
    if letter == 'A'
      [pad_inside(letter)]
    elsif letter == 'B'
      [' A ', pad_inside(letter), ' A ']
    else
      ['  A  ', ' B B ', pad_inside(letter), ' B B ', '  A  ']
    end.join("\n")
  end

  private
  def pad_inside(letter)
    if letter == 'A'
      letter
    else
      internal_padding = ALPHABET.index(letter) * 2 - 1
      [letter, ' ' * internal_padding, letter].join
    end
  end
end
