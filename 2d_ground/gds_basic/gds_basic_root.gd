extends PlaygroundScene



############################ Override ############################
func _init():
	super._init()
	
	scene_type = eSceneType.ROOT
	
	playground_action_manager = PlayGroundActionManager.new( self, "GD Script Basic", [
		  PlayGroundAction.new_mover( "Return to Root", 	Key.KEY_ESCAPE, "res://playground_main.tscn" )
		, PlayGroundAction.new_mover( "Empty",  			Key.KEY_1, 		"res://gds_basic/gds_basic_EmptyScene.tscn" )
		, PlayGroundAction.new_mover( "Path",  				Key.KEY_2, 		"res://gds_basic/gds_basic_devpath.tscn" )
		, PlayGroundAction.new_mover( "OS", 				Key.KEY_3, 		"res://gds_basic/gds_basic_OSScene.tscn" )
		, PlayGroundAction.new_mover( "Tree Order", 		Key.KEY_4, 		"res://gds_basic/gds_basic_tree_order.tscn" )
		, PlayGroundAction.new_mover( "Log", 				Key.KEY_5, 		"res://gds_basic/gds_basic_LogScene.tscn" )
		, PlayGroundAction.new_mover( "Keyboard Input", 	Key.KEY_6, 		"res://gds_basic/gds_basic_KeyboardInputScene.tscn" )
		, PlayGroundAction.new_mover( "Get Node", 			Key.KEY_7, 		"res://gds_basic/gds_basic_GetNodeScene.tscn" )
		, PlayGroundAction.new_mover( "Node Path3D", 		Key.KEY_8, 		"res://gds_basic/gds_basic_NodePathScene.tscn" )
	] )
