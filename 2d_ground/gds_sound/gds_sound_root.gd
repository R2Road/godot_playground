extends PlaygroundScene



############################ Override ############################
func _ready():
	scene_type = eSceneType.ROOT
	
	pam.set_name( "Sound" )
	pam.add_mover( "Playground",		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	
	build_summary()
