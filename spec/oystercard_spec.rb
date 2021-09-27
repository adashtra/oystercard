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
    expect { card.top_up 1 }.to change { card.balance }.by 1
  end

  it "raises an error if card limit is exceeded" do
    card = Oystercard.new
    card.top_up(5)
    # expect { card.top_up Oystercard::MAXIMUM_LIMIT }.to change { card.balance }.by Oystercard::MAXIMUM_LIMIT
    expect { card.top_up Oystercard::MAXIMUM_LIMIT }.to raise_error("Maximum limit of #{Oystercard::MAXIMUM_LIMIT} reached")
  end

  it "can deduct money to the balance" do
    card = Oystercard.new
    expect { card.deduct 1 }.to change { card.balance }.by -1
  end
end
