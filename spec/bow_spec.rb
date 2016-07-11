require "weapons/bow"
require 'spec_helper'

RSpec.describe Bow do
  let(:bow) {Bow.new}
  let (:bow_no_arrows) {Bow.new(0)}
    describe "#arrows" do

      it "arrow count is readable and does not raise error" do
        expect {bow.arrows}.not_to raise_error
      end

      it "displays the arrows" do
        expect(bow.arrows).to eq(10)
      end

      it "creates a bow with specified amount of arrows" do
        expect(Bow.new(20).arrows).to eq(20)
      end
    end

    describe "#use" do
      it "reduces the number of arrows by one" do
        bow.use
        expect(bow.arrows).to eq(9)
      end

      it "throws an error when bow has no more arrows" do
        expect{bow_no_arrows.use}.to raise_error
      end
    end


end