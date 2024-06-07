extends Node2D


############################ Variable ############################
var title = "UI"
var playground_action_manager = PlayGround_ActionManager.new(	[
	  NextSceneInfo.new( "Return to Root",  Key.KEY_ESCAPE, "res://playground_main.tscn" )
	, NextSceneInfo.new( "Label",  Key.KEY_1, "res://gds_ui/gds_ui_LabelScene.tscn" )
] )



############################ Override ############################
func _ready():
	set_process_input( true ) # is not need : default on
		
	var summury_node = get_node( "Summury" )
	summury_node.text = playground_action_manager.build_summary( title )
	summury_node.set_position(
		Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.5 )
		- Vector2( summury_node.get_minimum_size().x * 0.5, summury_node.get_minimum_size().y * 0.5 )
	)


func _input(event):
	playground_action_manager.do( self, event )
