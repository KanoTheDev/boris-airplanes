require_relative "../lib/plane"

describe Plane do
	let(:plane) {Plane.new}
	it "should be landed on creation" do
		expect(plane.landed?).to eq(true)
	end
	
end
