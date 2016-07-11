require "viking"
require 'spec_helper'

RSpec.describe Viking do

  let(:v) {Viking.new("Bob", 1)}

  describe "initialize" do 

    it "creates a viking with given name" do
      expect(v.name).to eq("Bob")
    end

    it "creates a viking with given health" do
      expect(v.health).to eq(1)
    end

    it "does not set new health for initialized viking" do
      expect{v.health = 10}.to raise_error
    end

    it "does not have any weapons when initialized" do
      expect(v.weapon).to eq(nil)
    end
  end

  describe "#pick_up_weapon(weapon)" do
    #let(:weapon) {Weapon.new("Laser Gun")}

    it "should raise an error if the weapon is not a weapon" do
      weapon = "String"
      expect{v.pick_up_weapon(weapon)}.to raise_error
    end

    it "picking up a weapon will give the viking the weapon" do
      weapon = double("Weapon", name: "Laser Gun", is_a?: Weapon)
      v.pick_up_weapon(weapon)
      expect(v.weapon).to eq(weapon)
    end
  end

end