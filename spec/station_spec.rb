require "station"

RSpec.describe Station do
  let(:station) { Station.new("Piccadilly", 1) }
  describe "#initialize" do
    it "responds to a name" do
      expect(station).to respond_to(:name)
    end
    it "responds to a zone" do
      expect(station).to respond_to(:zone)
    end
  end
end
