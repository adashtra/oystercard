require "oystercard.rb"

RSpec.describe Oystercard do
  it "checks the balance on the card" do
    card = Oystercard.new
    expect(card.balance).to eq 0
  end

  it "adds money to the card" do
    card = Oystercard.new 
    expect(card).to respond_to(:top_up).with(1).argument 
  end 

  it "can add money to the balance" do 
    card = Oystercard.new
    expect{card.top_up 1}.to change{card.balance}.by 1
  end 

  
end

Write a test that checks the top_up method throws an exception 
if the new balance would exceed the limit.