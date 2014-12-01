module PrintDiamond
  ALPHABET = Array('A'..'Z')

  def print_diamond(letter)
    rows = Array('A'..letter) + Array('A'...letter).reverse
    rows.map { |row_letter| row(row_letter, letter) }.join("\n")
  end

  private
  def row(row_letter, diamond_letter)
    PaddedRow.new(row_letter, diamond_letter)
  end

  class Row
    attr_reader :letter

    def initialize(letter)
      @letter = letter
    end

    def to_s
      if letter == 'A'
        letter
      else
        [letter, ' ' * internal_padding, letter].join
      end
    end

    private
    def internal_padding
      # 1 -> 1, 2 -> 3, 3 -> 5, ...
      ALPHABET.index(letter) * 2 - 1
    end
  end

  class PaddedRow
    attr_reader :diamond_letter, :row, :letter
    def initialize(letter, diamond_letter)
      @row = Row.new(letter)
      @letter = letter
      @diamond_letter = diamond_letter
    end

    def to_s
      padding = ALPHABET.index(diamond_letter) - ALPHABET.index(letter)
      [' ' * padding, row, ' ' * padding].join
    end
  end
end
