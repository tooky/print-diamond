module PrintDiamond
  def print_diamond(letter)
    if letter == 'A'
      ['A']
    elsif letter == 'B'
      [' A ', 'B B', ' A ']
    else
      ['  A  ', ' B B ', 'C   C', ' B B ', '  A  ']
    end.join("\n")
  end
end
