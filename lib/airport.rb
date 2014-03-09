class Airport
	def initialize
		@planes ||= []

	end

	def planes
		@planes
	end

	def land(plane, weather=Weather.new)
		if plane.status == 'flying' && weather.now == 'sunny'
		 	@planes << plane if plane.land
		end
	end

	def release(plane, weather=Weather.new)
		if plane.status == 'landed'
			@planes.delete(plane) if plane.take_off
		end
	end

end