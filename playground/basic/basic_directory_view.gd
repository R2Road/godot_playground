extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Directory View" )
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	show_directory()



############################   User   ############################
func show_directory():
	var str : String = "# Directories\n"
	
	var dir : DirAccess = DirAccess.open( OS.get_user_data_dir() )
	for d in dir.get_directories():
		str += d
		str += "\n"
	
	var message_node = get_node( "Message" )
	message_node.text = str( str )
	message_node.set_position(
			Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.5 )
			- ( Vector2( message_node.get_minimum_size().x * 0.5, message_node.get_minimum_size().y * 0.5 ) * $Message.get_scale() )
	)
	
	OS.shell_open( OS.get_user_data_dir() )
