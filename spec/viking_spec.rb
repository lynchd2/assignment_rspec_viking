require "viking"
require 'spec_helper'

RSpec.describe Viking do

  let(:v) {Viking.new("Bob", 100)}
  let(:enemy) { Viking.new("Tom", 100)}

  describe "initialize" do 

    it "creates a viking with given name" do
      expect(v.name).to eq("Bob")
    end

    it "creates a viking with given health" do
      expect(v.health).to eq(100)
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

    it "replaces the old weapon if a viking pick up a new one" do 
      another_weapon = double("Axe", name: "Big Axe", is_a?: Weapon )
      weapon = double("Weapon", name: "Laser Gun", is_a?: Weapon)
      v.pick_up_weapon(weapon)
      v.pick_up_weapon(another_weapon)
      expect(v.weapon).to eq(another_weapon)

    end

    
  end

  describe "#drop_weapon" do 

    specify "dropping a viking's weapon will set weapon to nil" do 
      weapon = double("Weapon", name: "Laser Gun", is_a?: Weapon)
      v.pick_up_weapon(weapon)
      v.drop_weapon
      expect(v.weapon).to eq(nil)
    end

  end

  describe "#receive_attack" do 

    specify "receive_attack will lower a viking's health by the specifed amount" do 
      expect{v.receive_attack(1)}.to change{v.health}.by(-1)
      
    end

    it "calls the take_damage method" do
      expect(v).to receive(:take_damage).with(10)
      v.receive_attack(10)
    end

  end


  describe "#attack" do 

    it "will cause the recipients health to drop when attacking another viking" do 
      
      v.attack(enemy)
    end

  end

end