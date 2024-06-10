extends PlaygroundScene



############################ Override ############################
func _ready():
	scene_type = eSceneType.ROOT
	
	pam.set_name( "UI" )
	pam.add_mover( "Return to Root",  Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_mover( "Label",  Key.KEY_1, "res://gds_ui/gds_ui_LabelScene.tscn" )
	
	build_summary()
