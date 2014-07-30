class Term
  attr_reader :word, :definition
  @@dictionary =[]
  def initialize word, definition
    @word = word
    @definition = definition
  end
  def Term.all
    @@dictionary
  end
  def Term.clear
    @@dictionary = []
  end
  def save
    @@dictionary << self
  end
end
