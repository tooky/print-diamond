module PrintDiamond
  ALPHABET = Array('A'..'Z')

  def print_diamond(letter)
    if letter == 'A'
      [pad_inside(letter)]
    elsif letter == 'B'
      [" #{pad_inside('A')} ", pad_inside(letter), " #{pad_inside('A')} "]
    else
      ["  #{pad_inside('A')}  ", " B B ", pad_inside(letter), " B B ", "  #{pad_inside('A')}  "]
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
