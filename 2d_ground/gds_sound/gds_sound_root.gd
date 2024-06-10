extends PlaygroundScene



############################ Override ############################
func _init():
	super._init()
	
	scene_type = eSceneType.ROOT
	
	pam.set_name( "Sound" )
	pam.add_mover( "Return to Root",  Key.KEY_ESCAPE, "res://playground_main.tscn" )
