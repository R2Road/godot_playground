extends PlaygroundScene



############################ Override ############################
func _init():
	super._init()
	
	scene_type = eSceneType.ROOT
	
	playground_action_manager.set_name( "GD Script Basic" )
	playground_action_manager.add_mover( "Return to Root", 	Key.KEY_ESCAPE, "res://playground_main.tscn" )
	playground_action_manager.add_mover( "Empty",  			Key.KEY_1, 		"res://gds_basic/gds_basic_EmptyScene.tscn" )
	playground_action_manager.add_mover( "Path",  			Key.KEY_2, 		"res://gds_basic/gds_basic_devpath.tscn" )
	playground_action_manager.add_mover( "OS", 				Key.KEY_3, 		"res://gds_basic/gds_basic_OSScene.tscn" )
	playground_action_manager.add_mover( "Tree Order", 		Key.KEY_4, 		"res://gds_basic/gds_basic_tree_order.tscn" )
	playground_action_manager.add_mover( "Log", 			Key.KEY_5, 		"res://gds_basic/gds_basic_LogScene.tscn" )
	playground_action_manager.add_mover( "Keyboard Input", 	Key.KEY_6, 		"res://gds_basic/gds_basic_KeyboardInputScene.tscn" )
	playground_action_manager.add_mover( "Get Node", 		Key.KEY_7, 		"res://gds_basic/gds_basic_GetNodeScene.tscn" )
	playground_action_manager.add_mover( "Node Path3D", 	Key.KEY_8, 		"res://gds_basic/gds_basic_NodePathScene.tscn" )
