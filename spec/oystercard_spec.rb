require "oystercard"

RSpec.describe OysterCard do

  let(:station) { double(:station) }
  let(:exit_station) { double(:exit_station) }

    describe '#initialize' do
        it 'creates each oystercard instance with a default balance' do
          expect(subject.balance).to eq 0
        end
        it 'has empty list of journeys by default' do
          expect(subject.list_of_journeys).to be_empty
          p subject.view_menu
        end
    end

    describe '#top_up' do
        it 'allows oyster card to be topped up' do
          expect { subject.top_up(5) }.to change { subject.balance }.to 5
        end

        it "raises error if balance is higher than 90" do
          expect{ subject.top_up(91) }.to raise_error "Limit exceeded: £#{OysterCard::MAX_LIMIT}! Cannot top up"
        end
    end
  
    describe '#touch_in' do
      before(:each) do
        subject.top_up(5)
      end
        it "can touch in" do
          expect { subject.touch_in(station) }.to change { subject.in_journey?}.to true
        end

        it "raises an error if oyster has insufficient funds" do
          card = OysterCard.new
          expect{ card.touch_in(station) }.to raise_error "Insufficient funds, you need at least £#{OysterCard::MIN_LIMIT} to touch in"
        end

        it "remembers the station you started journey from" do
          expect { subject.touch_in("Paddington") }.to change { subject.entry_station }.to "Paddington"
        end

        it "stores the entry_station in journey" do
          expect { subject.touch_in(station) }.to change { subject.journey["entry_station"] }.to station
        end
    end

    describe '#touch_out(exit_station)' do
        before(:each) do
          subject.top_up(5)
          subject.touch_in(exit_station)
        end

        it 'returns false if oyster is not in journey' do
          expect { subject.touch_out(exit_station) }.to change { subject.in_journey? }.to false
        end 

        it 'deducts the cost of the journey from the card when touching out' do
          expect { subject.touch_out(exit_station) }.to change{ subject.balance }.by(-OysterCard::MIN_CHARGE) 
        end

        it "forgets the entry station on touch out" do
          expect { subject.touch_out(exit_station) }.to change { subject.entry_station }.to nil
        end

        it "stores exit station" do
          expect { subject.touch_out(exit_station) }.to change { subject.journey["exit_station"] }.to exit_station
        end
    end

    describe '#in_journey?' do 
        it 'oyster card is initially not in journey' do
            expect(subject.in_journey?).to eq false
        end
         
    end
    
    describe '#list_of_journeys' do
        it "stores a list of previous journeys" do
            expect(subject.list_of_journeys).to be_truthy
        end

        it "is empty by default" do
        expect(subject.list_of_journeys).to be_empty
        end
    end

    describe "#journey" do
      it "checks that touching in and out creates one journey" do
        subject.top_up(5)
        subject.touch_in(station)
        subject.touch_out(exit_station)
        expect(subject.journey).to eq ( {"entry_station"=>station, "exit_station"=>exit_station} )
      end
    end
end