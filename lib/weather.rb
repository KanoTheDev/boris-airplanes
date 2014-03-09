class Weather

	def initialize

	end
	
	def wind_speed
		rand(0..99)
	end

	def now
		return 'stormy' if wind_speed >= 50
		'sunny'
	end
end