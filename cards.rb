#!/usr/bin/env ruby
require 'rspec'

module CardDefinition
  SUITS = ['diamonds', 'clubs', 'spades', 'hearts']
  VALUES = (2..10).to_a + ['J','Q','K','A']
end

class Card
  include CardDefinition
end

class Deck
  include CardDefinition

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
  end

end

