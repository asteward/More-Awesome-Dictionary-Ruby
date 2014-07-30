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
    # Term.all.each_with_index do |term, index|
    #   puts index.to_s + ") " + term.word
    # end
    space
    puts "V to view term"
    puts "E to edit term"
    puts "D for delete term"
    puts "M for main menu"
    puts "Please enter choice"
    term_choice = gets.chomp.downcase
    if term_choice == "v"
      term = term_reader
      view_term(term)
    elsif term_choice == "e"
      term = term_reader
      edit_term(term)
    elsif term_choice == "d"
      term = term_reader
      delete_term(term)
    elsif term_choice == "m"
      main_menu
    else
      puts "Invalid choice. Try again."
    end
  end
end

def edit_term term
  puts "What would you like the new definition to be?"
  edit_choice = gets.chomp.downcase
  Term.edit_term(term, edit_choice)
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
  term_num = Term.search(term)
  puts Term.all.at(term_num).word.upcase
  puts " " +Term.all.at(term_num).definition
  puts "----------"
  space
  puts "\nPress ENTER to continue..."
  gets.chomp
  main_menu
end

main_menu

