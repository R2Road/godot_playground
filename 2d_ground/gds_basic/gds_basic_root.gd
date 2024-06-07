extends Node2D



############################ Variable ############################
var playground_action_manager = PlayGroundActionManager.new( self, "GD Script Basic", [
	  PlayGroundAction.new_mover( "Return to Root", 	Key.KEY_ESCAPE, "res://playground_main.tscn" )
	, PlayGroundAction.new_mover( "Empty",  			Key.KEY_1, 		"res://gds_basic/gds_basic_EmptyScene.tscn" )
	, PlayGroundAction.new_mover( "OS", 				Key.KEY_2, 		"res://gds_basic/gds_basic_OSScene.tscn" )
	, PlayGroundAction.new_mover( "Tree Order", 		Key.KEY_3, 		"res://gds_basic/gds_basic_tree_order.tscn" )
	, PlayGroundAction.new_mover( "Log", 			Key.KEY_4, 		"res://gds_basic/gds_basic_LogScene.tscn" )
	, PlayGroundAction.new_mover( "Keyboard Input", 	Key.KEY_5, 		"res://gds_basic/gds_basic_KeyboardInputScene.tscn" )
	, PlayGroundAction.new_mover( "Get Node", 		Key.KEY_6, 		"res://gds_basic/gds_basic_GetNodeScene.tscn" )
	, PlayGroundAction.new_mover( "Node Path3D", 	Key.KEY_7, 		"res://gds_basic/gds_basic_NodePathScene.tscn" )
] )



############################ Override ############################
func _ready():
	set_process_input( true ) # is not need : default on
	
	var summury_node = get_node( "Summury" )	
	summury_node.text = playground_action_manager.build_summary()	
	summury_node.set_position(
		Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.5 )
		- Vector2( summury_node.get_minimum_size().x * 0.5, summury_node.get_minimum_size().y * 0.5 )
	)


func _input( event ):
	playground_action_manager.do( event )
