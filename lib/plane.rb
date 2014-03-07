class Plane
	def initialize
		@plane
		@status = 'flying'
	end

	def status
		@status
	end

	def land
		@status = 'landed'
	end

	def take_off
		@status = 'flying'
	end
end
