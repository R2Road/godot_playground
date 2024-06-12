extends Label



func _process( delta ):
	self.text = "fps : " + str( Engine.get_frames_per_second() )
