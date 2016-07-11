require 'warmup'
require 'spec_helper'

let(:shouter) { Warmup.new }

RSpec.describe Warmup do 

  describe "#gets_shout" do

    allow(shouter).to receive(:gets).and_return("hello world")

    it "capitalizes a string" do 
      expect(shouter.gets_shout).to eq("HELLO WORLD")
    end

  end

end