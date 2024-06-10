extends PlaygroundScene



############################ Override ############################
func _ready():
	scene_type = eSceneType.TEST
	
	pam.set_name( "Empty" )
	pam.add_back( Key.KEY_ESCAPE )
	
	build_summary()
