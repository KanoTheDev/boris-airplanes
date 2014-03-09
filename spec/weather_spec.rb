require_relative "../lib/weather"
require_relative "../lib/airport"
require_relative "../lib/plane"

describe Weather do

	let(:weather) {Weather.new}
	it "should respond to weather_now method" do
		expect(weather.now).not_to eq(nil)
	end 
end