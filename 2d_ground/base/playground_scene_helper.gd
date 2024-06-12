extends Label



############################ Override ############################
func _ready():
	self.position.y = get_viewport().size.y - self.get_minimum_size().y


func _process( _delta ):
	self.text = "fps : " + str( Engine.get_frames_per_second() )
