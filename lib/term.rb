class Term
  attr_reader :word
  attr_accessor :definition
  @@dictionary = []
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
  def Term.remove_term index
    Term.all.delete_at(index)
  end
  def Term.edit_term index, definition
    Term.all.at(index).definition = definition
  end
end
