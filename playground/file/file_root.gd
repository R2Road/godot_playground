class_name file_root extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "File Root"
	

static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_lf()
	pam.add_front( playground_main.scene_name(),		Key.KEY_ESCAPE, playground_main.scene_path() )
	pam.add_lf2()
	pam.add_root( file_path___handling.scene_name(),	Key.KEY_1, 		file_path___handling.scene_path() )
	pam.add_lf()
	pam.add_root( json_root.scene_name(),		Key.KEY_Q, 		json_root.scene_path() )
	pam.add_root( config_root.scene_name(),		Key.KEY_W, 		config_root.scene_path() )
	pam.add_lf()
	pam.add_split()
	build_summary( eSceneType.ROOT )
