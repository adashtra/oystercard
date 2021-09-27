require "oystercard.rb"

RSpec.describe Oystercard do
  it "checks the balance on the card" do
    card = Oystercard.new
    expect(card.check_balance).to eq 0
  end
end
