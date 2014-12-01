module PrintDiamond
  ALPHABET = Array('A'..'Z')

  def print_diamond(letter)
    rows = Array('A'..letter) + Array('A'...letter).reverse
    rows.map { |row_letter| row(row_letter, letter) }.join("\n")
  end

  private
  def row(row_letter, diamond_letter)
    pad_out(row_letter, diamond_letter, Row.new(row_letter))
  end

  def pad_out(letter, mid_letter, thing)
    padding = ALPHABET.index(mid_letter) - ALPHABET.index(letter)
    [' ' * padding, thing, ' ' * padding].join
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
end
