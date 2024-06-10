extends PlaygroundScene



############################ Override ############################
func _init():
	super._init()
	
	scene_type = eSceneType.TEST
	
	pam.set_name( "Empty" )
	pam.add_back( Key.KEY_ESCAPE )
