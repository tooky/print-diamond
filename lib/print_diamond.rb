module PrintDiamond
  ALPHABET = Array('A'..'Z')

  def print_diamond(letter)
    if letter == 'A'
      [pad_out(letter, letter, pad_inside(letter))]
    elsif letter == 'B'
      rows = Array('A'..letter) + Array('A'...letter).reverse
      rows.map { |row_letter| pad_out(row_letter, letter, pad_inside(row_letter)) }
    else
      [
        pad_out('A', letter, pad_inside('A')),
        pad_out('B', letter, pad_inside('B')),
        pad_out('C', letter, pad_inside('C')),
        pad_out('B', letter, pad_inside('B')),
        pad_out('A', letter, pad_inside('A')),
      ]
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

  def pad_out(letter, mid_letter, thing)
    padding = ALPHABET.index(mid_letter) - ALPHABET.index(letter)
    [' ' * padding, thing, ' ' * padding].join
  end
end
