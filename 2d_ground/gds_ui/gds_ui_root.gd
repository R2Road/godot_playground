extends PlaygroundScene



############################ Override ############################
func _init():
	super._init()
	
	scene_type = eSceneType.ROOT
	
	playground_action_manager.set_name( "UI" )
	playground_action_manager.add_mover( "Return to Root",  Key.KEY_ESCAPE, "res://playground_main.tscn" )
	playground_action_manager.add_mover( "Label",  Key.KEY_1, "res://gds_ui/gds_ui_LabelScene.tscn" )
