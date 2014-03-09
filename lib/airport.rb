class Airport
	DEFAULT_CAPACITY = 10
	def initialize(options = {})
		@planes ||= []
		self.capacity = options.fetch(:capacity, capacity) 
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def planes
		@planes
	end

	def land(plane, weather=Weather.new)
		return false if full?
		return false if weather.now == 'stormy'
		if plane.status == 'flying' && weather.now == 'sunny' #&& @planes.lenght < @capacity
		 	@planes << plane 
		 	plane.land
		end
	end

	def release(plane, weather=Weather.new)
		return false if weather.now == 'stormy'
		if plane.status == 'landed' && weather.now == 'sunny'
			@planes.delete(plane) 
			plane.take_off
		end
	end

	def full?
		@planes.length == @capacity
	end

end