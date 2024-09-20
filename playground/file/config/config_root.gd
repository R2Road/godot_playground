class_name config_root extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Config Root"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_front( file_root.scene_name(),	Key.KEY_ESCAPE, file_root.scene_path() )
	pam.add_lf()
	pam.add_mover( config___section.scene_name(),	Key.KEY_1, config___section.scene_path() )
	pam.add_mover( config___parse.scene_name(),		Key.KEY_2, config___parse.scene_path() )
	pam.add_mover( config___file_load.scene_name(),	Key.KEY_3, config___file_load.scene_path() )
	pam.add_split()
	build_summary( eSceneType.ROOT )
