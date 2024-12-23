class_name resolution_root extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Resolution Root"
	

static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_lf()
	pam.add_front( playground_main.scene_name(),		Key.KEY_ESCAPE, playground_main.scene_path() )
	pam.add_lf()
	pam.add_mover( resolution___viewport_size.scene_name(),	Key.KEY_1, resolution___viewport_size.scene_path() )
	pam.add_mover( resolution___option_test.scene_name(),	Key.KEY_2, resolution___option_test.scene_path() )
	pam.add_mover( resolution___full_screen.scene_name(),	Key.KEY_3, resolution___full_screen.scene_path() )
	pam.add_mover( resolution___content_scale_size.scene_name(),	Key.KEY_4, resolution___content_scale_size.scene_path() )
	pam.add_lf()
	pam.add_split()
	build_summary( eSceneType.ROOT )
