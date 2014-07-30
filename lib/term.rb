class Term
  attr_reader :word
  attr_accessor :definitions
  @@dictionary = []
  def initialize word, definition
    @word = word
    @definitions = []
    @definitions << definition
  end
  def add_definition new_def
    @definitions << new_def
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

  def edit_term definition, def_index
    @definitions[def_index] = definition
    #Term.all.at(index).definitions.at(def_index)
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

  def Term.object_search term
    index = Term.search(term)
    Term.all.at(index)
  end

  def object_return term
    term_num = Term.search(term)
    puts Term.all.at(term_num).word.upcase
    count = 0
    @definitions.each do |definition|
      puts " " + count.to_s+ ": " + definition
      count += 1
    end
    puts "----------"
  end
end
