class Location
	# Create new locations
	attr_accessor :location, :forward_path1, :forward_path2, :forward_path3, :forward_path4
	def initialize(location, forward_path1, forward_path2, forward_path3, forward_path4)
		@location = location
		@forward_path1 = forward_path1
		@forward_path2 = forward_path2
		@forward_path3 = forward_path3
		@forward_path4 = forward_path4
	end
end