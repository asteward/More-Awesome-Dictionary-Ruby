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

  def Term.remove_term term
    index = Term.search(term)
    Term.all.delete_at(index)
  end

  def Term.edit_term term, definition
    index = Term.search(term)
    Term.all.at(index).definition = definition
  end

  def Term.search term
    count = 0
    index = nil
    Term.all.each do |term_object|
      if term == term_object.word
        index = count
      end
      count += 1
    end
    index
  end
end
