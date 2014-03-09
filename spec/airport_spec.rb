require_relative "../lib/weather"
require_relative "../lib/airport"
require_relative "../lib/plane"

describe Airport do
	let(:airport) {Airport.new(:capacity => 2)}
	let(:plane) {Plane.new}
	let(:weather) {double(:weather, {:now => 'sunny'})}
	it "should have no planes by default" do
		expect(airport.planes.count).to eq(0)
	end

	context "Taking off and landing when sunny should" do

		it "have a plane when plane lands" do
			airport.land(plane, weather)
			expect(airport.planes).to eq([plane])
		end

		it "not have a plane when a plane takes off" do
			airport.land(plane, weather)
			airport.release(plane, weather)
			expect(airport.planes).to eq([])
		end

		it "change plane's status when plane arrives" do
			airport.land(plane, weather)
			expect(plane.status).to eq('landed')
		end

		it "change plane's status when plane takes off" do
			airport.land(plane, weather)
			airport.release(plane, weather)
			expect(plane.status).to eq('flying')
		end

	end

	context "Taking off and landing at the airport when stormy should not allow to" do
 
    it "land the plane when weather is stormy" do
    	weather = double(:weather, {:now => 'stormy'})
     	airport.land(plane, weather)
     	expect(airport.planes).to eq([])
    end

    it "take off the plane when weather is stormy" do
    	airport.land(plane, weather)
    	weather = double(:weather, {:now => 'stormy'})
     	airport.release(plane, weather)
     	expect(airport.planes).to eq([plane])
    end
	end

	context "landing when airport is full" do
		it "should return stop landing and false" do
			2.times do 
				this_plane_lands = Plane.new
				airport.land(this_plane_lands, weather)
			end
			this_plane_should_not_land = plane
			expect(airport.land(this_plane_should_not_land, weather)).to eq(false)
		end
	end
end

describe "The gand finale (last spec)" do
 let(:airport) {Airport.new(:capacity => 5)}
 let(:weather) {double(:weather, {:now => 'sunny'})}
    it 'all planes can land and all planes can take off' do
      5.times do
        plane = Plane.new
        airport.land(plane, weather)
      end
      
      until airport.planes.length < 1 do
        new_weather = Weather.new
        plane = airport.planes.first
        if airport.release(plane, new_weather)
          puts "#{plane} released"
        else
          puts "#{plane} not released. Now it is too #{weather.now}"
        end
      end
      expect(airport.planes.length).to eq(0)
    end

end
