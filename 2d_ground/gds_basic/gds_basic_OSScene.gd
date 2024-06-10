extends PlaygroundScene



############################ Override ############################
func _init():
	playground_action_manager = PlayGroundActionManager.new( self, "OS", [
		  PlayGroundAction.new_mover( "Return to Root",  Key.KEY_ESCAPE, "res://gds_basic/gds_basic_root.tscn" )
		, PlayGroundAction.new_lf()
		, PlayGroundAction.new_action( "OS.shell_open( url )",  Key.KEY_1, test_shell_open )
		, PlayGroundAction.new_action( "Time.get_datetime_dict_from_system()",  Key.KEY_2, test_get_dates )
	] )



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
