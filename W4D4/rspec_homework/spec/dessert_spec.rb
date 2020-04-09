require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("cake", 13, chef)} # Subject must be declared?

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(13)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "13", chef) }.to raise_error(ArgumentError) # Is this correct?
    end
  end

  describe "#add_ingredient" do
    before(:each) { dessert.add_ingredient("flour") } # Is this correct use of before?

    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to include("flour")
    end
  end

  describe "#mix!" do # Is this the correct way to test this spec?
    before(:each) do
      dessert.add_ingredient("flour")
      dessert.add_ingredient("eggs")
      dessert.add_ingredient("water")
      dessert.add_ingredient("sugar")
      dessert.add_ingredient("vanilla")
      dessert.mix!
    end

    let(:unmixed_ingredients) { ["flour", "eggs", "water", "sugar", "vanilla"] }
    let(:sorted_ingredients) { unmixed_ingredients.sort}

    it "shuffles the ingredient array" do
      expect(dessert.ingredients).not_to eq(unmixed_ingredients)
      expect(dessert.ingredients.sort).to eq(sorted_ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(5)
      expect(dessert.quantity).to eq(8) # Why is dessert.quantity returning 0 instead of 8?
    end

    subject(:dessert) { Dessert.new("cake", 5, chef) }

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(6) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to include(chef.titleize) # How do I give chef double the titleize method?
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
