	module Weather
		def wind_speed
			rand(0..99)
		end

		def storm
			return 'windy' if wind_speed >= 80
			'sunny'
		end
	end