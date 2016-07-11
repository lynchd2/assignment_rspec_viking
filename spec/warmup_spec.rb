require 'warmup'
require 'spec_helper'

RSpec.describe Warmup do 
let(:shouter) { Warmup.new }

  describe "#gets_shout" do 
    it "capitalizes a string" do 

      allow(shouter).to receive(:gets).and_return("hello world")
      expect(shouter.gets_shout).to eq("HELLO WORLD")

    end

  end

  describe "#triple_size" do
    it "triples the size of the array" do
      new_array = double("triple", size: 4)
      expect(shouter.triple_size(new_array)).to eq(12)
    end
  end

  describe "#call_methods(string)" do
    it "calls upcase on string parameter" do
      string = "string"
      expect(:shouter).to recieve()
  end

end