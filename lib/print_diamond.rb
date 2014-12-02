module PrintDiamond
  ALPHABET = Array('A'..'Z')

  def print_diamond(letter)
    rows(letter).map { |row_letter| PaddedRow.new(row_letter, letter) }.join("\n")
  end

  private
  def rows(letter)
    top(letter) + bottom(letter)
  end

  def top(letter)
    Diamond.new(letter).top
  end

  def bottom(letter)
    Array('A'...letter).reverse
  end

  class Diamond
    attr_reader :letter

    def initialize(letter)
      @letter = letter
    end

    def top
      Array('A'..letter)
    end
  end

  class Row
    attr_reader :letter

    def initialize(letter)
      @letter = letter
      create_chars
    end

    def to_s
      @chars.join
    end

    private
    def row_size
      # 0 -> 1, 1 -> 3, 3 -> 7, ...
      ALPHABET.index(letter) * 2 + 1
    end

    def create_chars
      @chars = Array.new(row_size) { ' ' }
      @chars[0] = letter
      @chars[-1] = letter
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
