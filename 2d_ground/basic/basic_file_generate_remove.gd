extends PlaygroundScene



############################ Variable ############################
var file_path = ( OS.get_user_data_dir() + "/basic_file_generate_remove.txt" )



############################ Override ############################
func _ready():
	pam.set_name( "File Generate/Remove" )
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "generate file", Key.KEY_1, generate_file )
	pam.add_action( "remove file", Key.KEY_2, remove_file )
	pam.add_action( "open dir", Key.KEY_3, open_directory )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	show_directory()


func _exit_tree():
	if DirAccess.dir_exists_absolute( file_path ):
		remove_file()



############################   User   ############################
func generate_file():
	var f = FileAccess.open( file_path,FileAccess.WRITE )
	show_directory()

func remove_file():
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
		str += "     d > "
		str += d
		str += "\n"
	
	for f in dir.get_files():
		str += "     f > "
		str += f
		str += "\n"
	
	var message_node = get_node( "Message" )
	message_node.text = str( str )
	message_node.set_position(
			get_viewport().size * 0.5
			- ( message_node.get_minimum_size() * message_node.get_scale() * 0.5 )
	)
