extends PlaygroundScene



############################ Override ############################
func _init():
	super._init()
	
	scene_type = eSceneType.TEST
	
	pam.set_name( "Dev Path" )
	pam.add_mover( "Exit",	Key.KEY_ESCAPE,	"res://gds_basic/gds_basic_root.tscn" )


func _ready():
	super._ready()
	
	var path_string : String
	
	# scene path
	path_string += "# self.scene_file_path"
	path_string += "\n"
	path_string += ( "     > " + self.scene_file_path )
	
	path_string += "\n\n" 
	
	# script path
	path_string += "# self.get_script().get_path()"
	path_string += "\n"
	path_string += ( "     > " + self.get_script().get_path() )
	
	path_string += "\n\n" 
	
	# data path
	path_string += "# OS.get_data_dir()"
	path_string += "\n"
	path_string += ( "     > " + OS.get_data_dir() )
	
	path_string += "\n\n" 
	
	# data path
	path_string += "# OS.get_config_dir()"
	path_string += "\n"
	path_string += ( "     > " + OS.get_config_dir() )
	
	path_string += "\n\n"
	
	# data path
	path_string += "# OS.get_user_data_dir()"
	path_string += "\n"
	path_string += ( "     > " + OS.get_user_data_dir() )
	
	path_string += "\n\n"
	
	# data path
	path_string += "# OS.get_cache_dir()"
	path_string += "\n"
	path_string += ( "     > " + OS.get_cache_dir() )
	
	path_string += "\n\n"
	
	# data path
	path_string += "# OS.get_system_dir( OS.SYSTEM_DIR_DOWNLOADS )"
	path_string += "\n"
	path_string += ( "     > " + OS.get_system_dir( OS.SYSTEM_DIR_DOWNLOADS ) )
	
	path_string += "\n\n"
	
	var label = Label.new()
	label.add_theme_color_override( "font_color", Color( 0, 1, 0, 1 ) )
	label.text = path_string
	label.set_position(
		Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.5 )
		- Vector2( label.get_minimum_size().x * 0.5, label.get_minimum_size().y * 0.5 )
	)
	add_child( label )
