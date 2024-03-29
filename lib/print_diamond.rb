module PrintDiamond
  ALPHABET = Array('A'..'Z')

  def print_diamond(letter)
    rows = Array('A'..letter) + Array('A'...letter).reverse
    rows.map { |row_letter| PaddedRow.new(row_letter, letter) }.join("\n")
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
        [letter, padding, letter].join
      end
    end

    private
    def padding_size
      # 1 -> 1, 2 -> 3, 3 -> 5, ...
      ALPHABET.index(letter) * 2 - 1
    end

    def padding
      ' ' * padding_size
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
      [padding, row, padding].join
    end

    private
    def padding
      ' ' * padding_size
    end

    def padding_size
      ALPHABET.index(diamond_letter) - ALPHABET.index(letter)
    end
  end
end
