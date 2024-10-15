class_name subviewport_basic extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Subviewport Basic"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_lf()
	pam.add_front( various_root.scene_name(), Key.KEY_ESCAPE, various_root.scene_path() )
	pam.add_lf()
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
