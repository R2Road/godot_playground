class_name various_root extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Various Root"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_front( playground_main.scene_name(),	Key.KEY_ESCAPE, playground_main.scene_path() )
	pam.add_lf()
	pam.add_root( audio_root.scene_name(),		Key.KEY_1, 		audio_root.scene_path() )
	pam.add_mover( inspector_struct.scene_name(),	Key.KEY_2, 		inspector_struct.scene_path() )
	pam.add_lf()
	pam.add_mover( rotation_basic.scene_name(),		Key.KEY_Q, 		rotation_basic.scene_path() )
	pam.add_mover( rotation_tracking.scene_name(),	Key.KEY_W, 		rotation_tracking.scene_path() )
	pam.add_lf()
	pam.add_mover( subviewport_basic.scene_name(),	Key.KEY_A, 		subviewport_basic.scene_path() )
	pam.add_split()
	build_summary( eSceneType.ROOT )
