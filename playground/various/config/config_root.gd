class_name config_root extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Config Root"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( config_root.scene_name() )
	pam.add_split()
	pam.add_front( various_root.scene_name(),	Key.KEY_ESCAPE, various_root.scene_path() )
	pam.add_lf()
	pam.add_mover( config_section.scene_name(),		Key.KEY_1, config_section.scene_path() )
	pam.add_mover( config_parse.scene_name(),		Key.KEY_2, config_parse.scene_path() )
	pam.add_split()
	build_summary( eSceneType.ROOT )
