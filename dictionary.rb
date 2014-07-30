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
  sleep 0.7
  main_menu
end

def list_terms
  system 'clear'
  header
  Term.all.each_with_index do |term, index|
    puts index.to_s + ") " + term.word
  end
  space
  puts "V to view term"
  puts "E to edit term"
  puts "D for delete term"
  puts "M for main menu"
  puts "Please enter choice"
  term_choice = gets.chomp.downcase
  if term_choice == "v"
    puts "Please enter corresponding index number"
  elsif term_choice == "e"
    puts "Please Enter corresponding index number"
  elsif term_choice == "d"
    puts "Please Enter corresponding index number"
  elsif term_choice == "m"
    main_menu
  end
  view_term(term_choice)
end

def view_term term_num
  system 'clear'
  header
  puts Term.all.at(term_num).word
  puts Term.all.at(term_num).definition
  space
  main_menu
end

main_menu