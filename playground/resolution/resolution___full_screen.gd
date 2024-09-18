class_name resolution___full_screen extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Resolution : Full Screen"
	

static func scene_path()->String:
	return super.scene_path()



############################ Variable ############################
var default_window_mode : DisplayServer.WindowMode



############################ Override ############################
func _ready()->void:
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "Toggle Full Screen", Key.KEY_SPACE, toggle_full_screen )
	pam.add_lf()
	pam.add_split()
	build_summary( eSceneType.TEST )
	
	#
	#
	#
	
	default_window_mode = DisplayServer.window_get_mode()


func _exit_tree() -> void:
	DisplayServer.window_set_mode( default_window_mode )



############################   User   ############################
func toggle_full_screen()->void:
	if DisplayServer.WINDOW_MODE_FULLSCREEN == DisplayServer.window_get_mode():
		DisplayServer.window_set_mode( default_window_mode )
	else:
		DisplayServer.window_set_mode( DisplayServer.WINDOW_MODE_FULLSCREEN )
