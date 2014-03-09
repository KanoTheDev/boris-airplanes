class Airport
	DEFAULT_CAPACITY = 5
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
		raise "Airport is full" if full?
		if plane.status == 'flying' && weather.now == 'sunny' #&& @planes.lenght < @capacity
		 	@planes << plane if plane.land

		end
	end

	def release(plane, weather=Weather.new)
		if plane.status == 'landed'
			@planes.delete(plane) if plane.take_off
		end
	end

	def full?
		@planes.length == 2
	end




end