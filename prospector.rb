class Prospector
	#Create new driver
	attr_accessor :prospector_name, :num_gold, :num_silver
	def initialize(prospector_name, num_gold, num_silver)
		@prospector_name = prospector_name
		@num_gold = num_gold
		@num_silver = num_silver
	end
end