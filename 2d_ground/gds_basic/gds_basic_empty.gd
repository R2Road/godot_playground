extends PlaygroundScene



############################ Override ############################
func _init():
	super._init()
	
	scene_type = eSceneType.TEST
	
	pam.set_name( "Empty" )
	pam.add_mover( "Return to Root",  Key.KEY_ESCAPE, "res://gds_basic/gds_basic_root.tscn" )
