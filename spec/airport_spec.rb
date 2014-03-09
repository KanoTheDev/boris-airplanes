require_relative "../lib/weather"
require_relative "../lib/airport"
require_relative "../lib/plane"

describe Airport do
	let(:airport) {Airport.new}
	let(:plane) {Plane.new}
	let(:weather) {double(:weather, {:now => 'sunny'})}
	it "should have no planes by default" do
		expect(airport.planes.count).to eq(0)
	end
	context "taking off and landing when sunny" do

		it "should have a plane when plane lands" do
			airport.land(plane, weather)
			expect(airport.planes).to eq([plane])
		end

		it "should not have a plane when a plane takes off" do
			airport.land(plane, weather)
			airport.release(plane)
			expect(airport.planes).to eq([])
		end

		it "should change plane's status when plane arrives" do
			airport.land(plane, weather)
			expect(plane.status).to eq('landed')
		end

		it "should change plane's status when plane takes off" do
			airport.land(plane, weather)
			airport.release(plane)
			expect(plane.status).to eq('flying')
		end

	end

	context "taking off and landing when stormy"
 
    it "should not allow to land the plane when weather is stormy" do
    	weather = double(:weather, {:now => 'stormy'})
     	airport.land(plane, weather)
     	expect(airport.planes).to eq([])
    end

    it "should not allow to take off the plane when weather is stormy" do
    	airport.land(plane, weather)
    	weather = double(:weather, {:now => 'stormy'})
     	airport.release(plane, weather)
     	expect(airport.planes).to eq([])
    end

  end