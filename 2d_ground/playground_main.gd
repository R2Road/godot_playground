extends Node2D



############################ Variable ############################
var playground_action_manager = PlayGroundActionManager.new( self, "PlayGround", [
	  PlayGroundAction.new_mover( "Exit",	Key.KEY_ESCAPE,	"res://playground_exit.tscn" )
	, PlayGroundAction.new_lf()
	, PlayGroundAction.new_mover( "Basic",  Key.KEY_1, 		"res://gds_basic/gds_basic_root.tscn" )
	, PlayGroundAction.new_mover( "UI", 	Key.KEY_2, 		"res://gds_ui/gds_ui_root.tscn" )
	, PlayGroundAction.new_mover( "Sound",	Key.KEY_3, 		"res://gds_sound/gds_sound_root.tscn" )
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


func _input(event):
	playground_action_manager.do( event )
