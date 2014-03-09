require_relative "weather"

class Airport
	include Weather
	def initialize
		@planes ||= []
	end

	def planes
		@planes
	end

	def land(plane)
		if plane.status == 'flying'
		 	@planes << plane if plane.land
		 	

		end
	end

	def release(plane)
		if plane.status == 'landed'
			@planes.delete(plane) if plane.take_off
		end
	end


	
	
end