extends Label



############################ Override ############################
func _ready():
	self.position.y = get_viewport().size.y - self.get_minimum_size().y


func _process( _delta ):
	self.text = (
		str( get_viewport().size.x ) + " x " + str( get_viewport().size.y )
		+ "\n"
		+ "fps : " + str( Engine.get_frames_per_second() )
	)
