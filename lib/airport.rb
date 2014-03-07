class Airport
	def initialize
		@planes ||= []
	end

	def planes
		@planes
	end

	def land(plane)
		if plane.status == 'flying'
		 	@planes << plane
		 	plane.land

		end
	end

	def release(plane)
		if plane.status == 'landed'
			@planes.delete(plane) 
			plane.take_off
		end
	end



	#weather
	def wind_speed
		rand(0..99)
	end

	def storm
		return 'windy' if wind_speed >= 80
		'sunny'
	end
end