class Weather

	def initialize

	end
	def wind_speed
		rand(0..99)
	end

	def now
		return 'windy' if wind_speed >= 80
		'sunny'
	end
end