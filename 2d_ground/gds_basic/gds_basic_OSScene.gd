extends Node2D



############################ Variable ############################
var playground_action_manager = PlayGroundActionManager.new( self, "OS", [
	  PlayGroundAction.new_mover( "Return to Root",  Key.KEY_ESCAPE, "res://gds_basic/gds_basic_root.tscn" )
	, PlayGroundAction.new_lf()
	, PlayGroundAction.new_action( "Shell Open",  Key.KEY_1, test_shell_open )
	, PlayGroundAction.new_action( "Get Dates",  Key.KEY_2, test_get_dates )
] )



############################ Override ############################
func _ready():
	set_process_input( true ) # is not need : default on
		
	var summury_node = get_node( "Summury" )
	summury_node.text = playground_action_manager.build_summary()
	
	
func _input(event):
	playground_action_manager.do( event )



############################   User   ############################
func test_shell_open():
	UpdateMessage( OS.shell_open("https://godotengine.org/") )


func test_get_dates():
	UpdateMessage( Time.get_datetime_dict_from_system() )


func UpdateMessage( arg ):
	var message_node = get_node( "Message" )
	message_node.text = str( arg )
	message_node.set_position(
			Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.5 )
			- ( Vector2( message_node.get_minimum_size().x * 0.5, message_node.get_minimum_size().y * 0.5 ) * $Message.get_scale() )
	)
