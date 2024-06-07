extends Node2D



############################ Variable ############################
var title = "GD Script Basic"
var next_scene_manager = NextSceneManager.new(	[
	  NextSceneInfo.new( "Return to Root", 	Key.KEY_ESCAPE, "res://playground_main.tscn" )
	, NextSceneInfo.new( "Empty",  			Key.KEY_1, 		"res://gds_basic/gds_basic_EmptyScene.tscn" )
	, NextSceneInfo.new( "OS", 				Key.KEY_2, 		"res://gds_basic/gds_basic_OSScene.tscn" )
	, NextSceneInfo.new( "Tree Order", 		Key.KEY_3, 		"res://gds_basic/gds_basic_TreeOrderScene.tscn" )
	, NextSceneInfo.new( "Log", 			Key.KEY_4, 		"res://gds_basic/gds_basic_LogScene.tscn" )
	, NextSceneInfo.new( "Keyboard Input", 	Key.KEY_5, 		"res://gds_basic/gds_basic_KeyboardInputScene.tscn" )
	, NextSceneInfo.new( "Get Node", 		Key.KEY_6, 		"res://gds_basic/gds_basic_GetNodeScene.tscn" )
	, NextSceneInfo.new( "Node Path3D", 	Key.KEY_7, 		"res://gds_basic/gds_basic_NodePathScene.tscn" )
] )



############################ Override ############################
func _ready():
	set_process_input( true ) # is not need : default on
	
	var summury_node = get_node( "Summury" )	
	summury_node.text = next_scene_manager.build_summary( title )	
	summury_node.set_position(
		Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.5 )
		- Vector2( summury_node.get_minimum_size().x * 0.5, summury_node.get_minimum_size().y * 0.5 )
	)


func _input(event):
	next_scene_manager.do( self, event )
