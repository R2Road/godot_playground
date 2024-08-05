class_name various_root extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Various Root"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( various_root.scene_name() )
	pam.add_split()
	pam.add_mover( playground_main.scene_name(),	Key.KEY_ESCAPE, playground_main.scene_path() )
	pam.add_lf()
	pam.add_mover( audio_root.scene_name(),		Key.KEY_A, 		audio_root.scene_path() )
	pam.add_mover( json_root.scene_name(),		Key.KEY_S, 		json_root.scene_path() )
	pam.add_mover( config_root.scene_name(),		Key.KEY_D, 		config_root.scene_path() )
	pam.add_mover( inspector_struct.scene_name(),	Key.KEY_F, 		inspector_struct.scene_path() )
	pam.add_split()
	build_summary( eSceneType.ROOT )
