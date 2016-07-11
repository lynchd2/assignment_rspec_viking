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

  describe "#calls_some_methods(string)" do
    it "calls upcase on string parameter" do
      string = "string"
      #expect(shouter).to recieve(:upcase!).with(string).and_return("STRING")
      expect(string).to receive(:upcase!).and_return("STRING")
      shouter.calls_some_methods(string)
    end

    it "calls upcase on string parameter" do
      #string_one = double("string")
      #string = double("string", empty?: false, upcase!: string_one)
      string = "string"
      expect(string).to receive(:reverse!).and_return("gnirts")
      shouter.calls_some_methods(string)
    end

    it "returns a different object than the one originally passed in" do 
      string = "string"
      expect(shouter.calls_some_methods(string).object_id).not_to eq(string.object_id)
    end
  end

end