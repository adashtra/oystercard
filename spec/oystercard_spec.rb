require "oystercard"

RSpec.describe OysterCard do

  let(:station) { double(:station) }

    describe '#initialize' do
        it 'creates each oystercard instance with a default balance' do
            expect(subject.balance).to eq 0
        end
    end

    describe '#top_up' do
        it 'allows oyster card to be topped up' do
          subject.top_up(5)
          expect(subject.balance).to eq 5
        end

        it "raises error if balance is higher than 90" do
          maximum = OysterCard::MAX_LIMIT 
          expect{ subject.top_up(91) }.to raise_error "Limit exceeded: £#{maximum}! Cannot top up"
        end
    end
  
    describe '#touch_in' do
      before(:each) do
        subject.top_up(5)
      end
        it "can touch in" do
            subject.touch_in(station)
            expect(subject.in_journey?).to be_truthy
        end

        it "raises an error if oyster has insufficient funds" do
          card = OysterCard.new
          expect{ card.touch_in(station) }.to raise_error "Insufficient funds, you need at least £#{OysterCard::MIN_LIMIT} to touch in"
        end

        it "remembers the station you started journey from" do
          allow(station).to receive(:name).and_return("Paddington")
          subject.touch_in(station.name)
          expect(subject.entry_station).to eq "Paddington"
        end
    end

    describe '#touch_out' do
        it 'returns false if oyster is not in journey' do
            subject.touch_out
            expect(subject.in_journey?).to eq false
        end 

        it 'deducts the cost of the journey from the card when touching out' do
          subject.top_up(5)
          subject.touch_in(station)
          expect { subject.touch_out }.to change{ subject.balance }.by(-OysterCard::MIN_CHARGE) 
        end

        it "forgets the entry station on touch out" do
          subject.top_up(5)
          subject.touch_in(station)
          subject.touch_out
          expect(subject.entry_station).to eq nil
        end
    end

    describe '#in_journey?' do 
        it 'oyster card is initially not in journey' do
            expect(subject.in_journey?).to eq false
        end
    end
end