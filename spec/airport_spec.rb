require_relative "../lib/airport"
require_relative "../lib/plane"

describe Airport do

	let(:airport) {Airport.new}
	let(:plane) {Plane.new}
	it "should have no planes by default" do
		expect(airport.planes.count).to eq(0)
	end

	it "should have a plane when plane lands" do
		airport.land(plane)
		expect(airport.planes).to eq([plane])
	end

	it "should not have a plane when a plane takes off" do
		airport.land(plane)
		airport.release(plane)
		expect(airport.planes).to eq([])
	end

	it "should change plane status when plane arrives" do
		airport.land(plane)
		expect(plane.status).to eq('landed')
	end

	it "should change plane status when plane takes off" do
		airport.land(plane)
		airport.release(plane)
		expect(plane.status).to eq('flying')
	end

	


	
# Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
    # context 'weather conditions' do
    #   it 'a plane cannot take off when there is a storm brewing' do
    #   end
      
    #   it 'a plane cannot land in the middle of a storm' do
    #   end
    # end
  end