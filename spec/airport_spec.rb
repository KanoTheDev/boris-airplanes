require_relative "../lib/weather"
require_relative "../lib/airport"
require_relative "../lib/plane"

describe Airport do

	let(:airport) {Airport.new}
	let(:plane) {Plane.new}
	it "should have no planes by default" do
		expect(airport.planes.count).to eq(0)
	end

	it "should have a plane when plane lands" do
		weather = double(:weather, {:now => 'sunny'})
		airport.land(plane, weather)
		expect(airport.planes).to eq([plane])
	end

	it "should not have a plane when a plane takes off" do
		weather = double(:weather, {:now => 'sunny'})
		airport.land(plane, weather)
		airport.release(plane)
		expect(airport.planes).to eq([])
	end

	it "should change plane status when plane arrives" do
		weather = double(:weather, {:now => 'sunny'})
		airport.land(plane, weather)
		expect(plane.status).to eq('landed')
	end

	it "should change plane status when plane takes off" do
		weather = double(:weather, {:now => 'sunny'})
		airport.land(plane, weather)
		airport.release(plane)
		expect(plane.status).to eq('flying')
	end



	


    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
    # context 'weather conditions' do

    it "should allow to land the plane when weather is sunny" do
    	weather = double(:weather, {:now => 'sunny'})
     	airport.land(plane, weather)
     	expect(airport.planes).to eq([plane])
    end

    it "should allow to take off the plane when weather is sunny" do
    	weather = double(:weather, {:now => 'sunny'})
     	airport.land(plane)
     	airport.release(plane, weather)
     	expect(airport.planes).to eq([])
    end

    it "should not allow to land the plane when weather is stormy" do
    	weather = double(:weather, {:now => 'stormy'})
     	airport.land(plane, weather)
     	expect(airport.planes).to eq([])
    end

    it "should not allow to take off the plane when weather is stormy" do
    	weather = double(:weather, {:now => 'sunny'})
    	airport.land(plane, weather)
    	weather = double(:weather, {:now => 'stormy'})
     	airport.release(plane, weather)
     	expect(airport.planes).to eq([])
    end
  end