require_relative "../lib/airport"

describe Airport do
	let(:airport) {Airport.new}
	it "should have no planes by default" do
		expect(airport.planes.count).to eq(0)
	end
	
end
