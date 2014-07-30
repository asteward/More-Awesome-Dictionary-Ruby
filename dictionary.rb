require './lib/term'

def space
  puts "\n"
end

def header
  system 'clear'
  puts "
────────────────────────────────────────────────────────────────────────────────────────
─██████████████─██████████████─████████████████───██████──────────██████─██████████████─
─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░██████████████░░██─██░░░░░░░░░░██─
─██████░░██████─██░░██████████─██░░████████░░██───██░░░░░░░░░░░░░░░░░░██─██░░██████████─
─────██░░██─────██░░██─────────██░░██────██░░██───██░░██████░░██████░░██─██░░██─────────
─────██░░██─────██░░██████████─██░░████████░░██───██░░██──██░░██──██░░██─██░░██████████─
─────██░░██─────██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░██──██░░██──██░░██─██░░░░░░░░░░██─
─────██░░██─────██░░██████████─██░░██████░░████───██░░██──██████──██░░██─██████████░░██─
─────██░░██─────██░░██─────────██░░██──██░░██─────██░░██──────────██░░██─────────██░░██─
─────██░░██─────██░░██████████─██░░██──██░░██████─██░░██──────────██░░██─██████████░░██─
─────██░░██─────██░░░░░░░░░░██─██░░██──██░░░░░░██─██░░██──────────██░░██─██░░░░░░░░░░██─
─────██████─────██████████████─██████──██████████─██████──────────██████─██████████████─
────────────────────────────────────────────────────────────────────────────────────────
"
end

def main_menu
  loop do
    header
    space
    puts "N > Add new term"
    puts "L > Show all terms"
    puts "X > Exit"
    space
    main_choice = gets.chomp.upcase
    if main_choice == "N"
      add_term
    elsif main_choice == "L"
      list_terms
    elsif main_choice == "X"
      puts "Fine! Go use UrbanDictionary... (ง'̀-'́)ง"
      exit
    else
      system 'clear'
      puts "Invalid! Try again"
    end
  end
end

def add_term
  system 'clear'
  header
  puts "Each Term should have a word and definition."
  puts "For example: 'dog' and 'drools a lot'."
  space
  puts "Please enter a word:"
  input_word = gets.chomp.downcase
  space
  puts "Please enter a definition for " + input_word + ":"
  input_def = gets.chomp.downcase

  new_term = Term.new(input_word, input_def).save
  space
  puts "New Term Added To The Dictionary!"
  space
  puts "\nPress ENTER to continue..."
  gets.chomp
  main_menu
end

def list_terms
  loop do
    system 'clear'
    header
    space
    puts "V to view term"
    puts "E to edit term"
    puts "D for delete term"
    puts "M for main menu"
    puts "A for add definition to term"
    puts "Please enter choice"
    term_choice = gets.chomp.downcase
    if term_choice == "v"
      term = term_reader
      view_term(term)
      main_menu
    elsif term_choice == "e"
      term = term_reader
      edit_term(term)
    elsif term_choice == "d"
      term = term_reader
      delete_term(term)
    elsif term_choice == "a"
      term = term_reader
      add_definition(term)
    elsif term_choice == "m"
      main_menu

    else
      puts "Invalid choice. Try again."
    end
  end
end

def add_definition term
  word_object = Term.object_search(term)
  puts "Please enter in new definition:"
  new_def = gets.chomp.downcase
  word_object.add_definition(new_def)
  puts "Definition has been added"
  puts "Press ENTER to continue"
  gets.chomp
  list_terms
end

def edit_term term

  word_object = Term.object_search(term)
  word_object.object_return(term)
  space
  puts "Which definition would you like to change?"
  def_index = gets.chomp.to_i
  puts "What would you like the new definition to be?"
  edit_choice = gets.chomp.downcase
  word_object.edit_term(edit_choice, def_index)
  puts "Term has been updated"
  puts "\nPress ENTER to continue..."
  gets.chomp
end

def delete_term term
  Term.remove_term(term)
  puts "Term has been deleted"
  puts "\nPress ENTER to continue..."
  gets.chomp
end

def term_reader
  puts "Enter term:"
  choice = gets.chomp
end


def view_term term
  system 'clear'
  header
  word_object = Term.object_search(term)
  word_object.object_return(term)
  space
  puts "\nPress ENTER to continue..."
  gets.chomp
end

main_menu

