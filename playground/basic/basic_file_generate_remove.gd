extends GDPTScene



############################ Variable ############################
var dir_path = OS.get_user_data_dir()
var file_path = ( dir_path + "/basic_file_generate_remove.txt" )



############################ Override ############################
func _ready():
	pam.set_name( "File Generate/Remove" )
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "generate file", Key.KEY_1, generate_file )
	pam.add_action( "remove file", Key.KEY_2, remove_file )
	pam.add_action( "open file explorer", Key.KEY_3, open_directory )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	show_directory()


func _exit_tree():
	if FileAccess.file_exists( file_path ):
		remove_file()



############################   User   ############################
func generate_file():
	var f : FileAccess = FileAccess.open( file_path,FileAccess.WRITE )
	f.store_string( "abcd\nefgh\n1234\n가나다라마바사" )
	show_directory()

func remove_file():
	DirAccess.remove_absolute( file_path )
	show_directory()

func open_directory():
	OS.shell_open( dir_path )

func show_directory():
	var str : String = ( 
		"# Directories"
		+ "\n"
		+ "( " + dir_path + " )"
		+ "\n"
	)
	
	var dir : DirAccess = DirAccess.open( dir_path )
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
