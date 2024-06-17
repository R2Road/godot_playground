extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "OS" )
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "OS.shell_open( url )",  Key.KEY_1, test_shell_open_url )
	pam.add_action( "OS.shell_open( dir )",  Key.KEY_2, test_shell_open_dir )
	pam.add_action( "Time.get_datetime_dict_from_system()",  Key.KEY_3, test_get_dates )
	build_summary( eSceneType.TEST )



############################   User   ############################
func test_shell_open_url():
	UpdateMessage( OS.shell_open("https://godotengine.org/") )


func test_shell_open_dir():
	OS.shell_open( "C://" )
	UpdateMessage( "OS.shell_open( \"C://\" )" )


func test_get_dates():
	UpdateMessage( Time.get_datetime_dict_from_system() )


func UpdateMessage( arg ):
	var message_node = get_node( "Message" )
	message_node.text = str( arg )
	message_node.set_position(
			Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.5 )
			- ( Vector2( message_node.get_minimum_size().x * 0.5, message_node.get_minimum_size().y * 0.5 ) * $Message.get_scale() )
	)
