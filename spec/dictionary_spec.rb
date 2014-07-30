require 'rspec'
require 'term'

describe 'Term' do
  it 'initializes a new term' do
    new_term = Term.new('cat', 'a sneaky animal')
    expect(new_term).to be_an_instance_of Term
  end

  it 'returns the word of a Term' do
    new_term = Term.new('cat', 'a sneaky animal')
    expect(new_term.word).to eq "cat"
  end

  it 'returns the definition of a Term' do
    new_term = Term.new('cat', 'a sneaky animal')
    expect(new_term.definition).to eq "a sneaky animal"
  end

  describe '.save' do
    it 'saves the term to the dictionary' do
      Term.clear
      new_term = Term.new('fish', 'it breath water').save
      expect(Term.all).to eql new_term
    end
  end

  describe '.clear' do
    it 'clears the terms from the dictionary' do
      Term.clear
      new_term = Term.new('fish', 'it breath water').save
      Term.clear
      expect(Term.all).to eql []
    end
  end

  describe '.all' do
    it 'lists all terms in the dictionary' do
      Term.clear
      new_term = Term.new('fish', 'it breath water').save
      new_term2 = Term.new('cat', 'a sneaky animal').save
      expect(Term.all.length).to eq 2
    end
  end
end
