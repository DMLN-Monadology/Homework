require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)!
 Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:brownie) { Dessert.new("brownie", 100) }

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "tons") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do

    let(:brownie) { Dessert.new("brownie", 100) }

    it "adds an ingredient to the ingredients array" do
      brownie.add_ingredient("Leninade")
      expect(brownie.ingredients[-1]).to eq("Leninade")
    end


  end

  describe "#mix!" do

    let(:brownie) { Dessert.new("brownie", 100) }

    it "shuffles the ingredient array" do
      original_order = Array.new(brownie.ingredients)
      brownie.mix!
      expect(brownie.ingredients).not_to equal(original_order)
    end
  end

  describe "#eat" do
    let(:brownie) { Dessert.new("brownie", 1945) }

    it "subtracts an amount from the quantity" do
      brownie.eat(1900)
      expect(brownie.quantity).to eq(45)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { brownie.eat(1991) }.to raise_error("not enough left!")
    end
  end
end
