extends PlaygroundScene



############################ Variable ############################
var file_path = ( OS.get_user_data_dir() + "/basic_directory_generate_remove" )



############################ Override ############################
func _ready():
	pam.set_name( "Directory Generate/Remove" )
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "generate dir", Key.KEY_1, generate_directory )
	pam.add_action( "remove dir", Key.KEY_2, remove_directory )
	pam.add_action( "open dir", Key.KEY_3, open_directory )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	show_directory()


func _exit_tree():
	if DirAccess.dir_exists_absolute( file_path ):
		remove_directory()



############################   User   ############################
func generate_directory():
	DirAccess.make_dir_absolute( file_path )
	show_directory()

func remove_directory():
	DirAccess.remove_absolute( file_path )
	show_directory()

func open_directory():
	OS.shell_open( OS.get_user_data_dir() )

func show_directory():
	var str : String = ( 
		"# Directories"
		+ "\n"
		+ "( " + OS.get_user_data_dir() + " )"
		+ "\n"
	)
	
	var dir : DirAccess = DirAccess.open( OS.get_user_data_dir() )
	for d in dir.get_directories():
		str += "     > "
		str += d
		str += "\n"
	
	var message_node = get_node( "Message" )
	message_node.text = str( str )
	message_node.set_position(
			Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.5 )
			- ( Vector2( message_node.get_minimum_size().x * 0.5, message_node.get_minimum_size().y * 0.5 ) * $Message.get_scale() )
	)
