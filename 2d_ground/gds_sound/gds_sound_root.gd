extends PlaygroundScene



############################ Override ############################
func _init():
	super._init()
	
	scene_type = eSceneType.ROOT
	
	playground_action_manager.set_name( "Sound" )
	playground_action_manager.add_mover( "Return to Root",  Key.KEY_ESCAPE, "res://playground_main.tscn" )
