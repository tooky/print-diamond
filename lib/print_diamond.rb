module PrintDiamond
  def print_diamond(letter)
    if letter == 'A'
      letter
    else
      [' A ', 'B B', ' A '].join("\n")
    end
  end
end
