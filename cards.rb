#!/usr/bin/env ruby
require 'rspec'

module CardDefinition
  SUITS = ['diamonds', 'clubs', 'spades', 'hearts']
  VALUES = (2..10).to_a + ['J','Q','K','A']
end

class Card
  include CardDefinition
  attr_accessor :suit, :value

  def initialize(suit,value)
    @suit = suit
    @value = value
  end

  def number_value
    if value == 'A'
      11
    elsif ['J','Q','K'].include?(value)
      10
    else
      value
    end
  end
end

class Deck
  include CardDefinition
  attr_accessor :cards

  def initialize
    @cards = []
    SUITS.each do |suit|
      VALUES.each do |value|
        @cards << Card.new(suit,value)
      end
    end
    self.shuffle
  end

  def shuffle
    self.cards.shuffle!
  end
end


RSpec.describe "card stuff" do

  describe "cards" do
    it "can access the CardDefinition constants" do
      expect(Card::SUITS.is_a? Array).to eq true
      expect(Card::SUITS.length).to eq 4
    end
  end

  describe "deck" do
    it "can access the CardDefinition constants" do
      expect(Deck::SUITS.is_a? Array).to eq true
      expect(Deck::SUITS.length).to eq 4
    end

    it "creates a 52 card deck" do
      expect(Deck.new.cards.length).to eq 52
    end

    it "can shuffle a deck" do
      deck = Deck.new
      cards = deck.cards.dup
      deck.shuffle
      expect(deck.cards).not_to eq cards
    end
  end

end

