class_name script_root extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Script Root"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_lf()
	pam.add_front( playground_main.scene_name(),	Key.KEY_ESCAPE, playground_main.scene_path() )
	pam.add_lf()
	pam.add_mover( script___stack.scene_name(),		Key.KEY_1, script___stack.scene_path() )
	pam.add_mover( script___path.scene_name(),		Key.KEY_2, script___path.scene_path() )
	pam.add_mover( script___load_and_run.scene_name(),	Key.KEY_3, script___load_and_run.scene_path() )
	pam.add_lf()
	pam.add_mover( script___runtime_parse_and_run.scene_name(),		Key.KEY_Q, script___runtime_parse_and_run.scene_path() )
	pam.add_lf()
	pam.add_mover( script___property_list.scene_name(),			Key.KEY_A, script___property_list.scene_path() )
	pam.add_mover( script___property_access.scene_name(),		Key.KEY_S, script___property_access.scene_path() )
	pam.add_mover( script___property_list_const.scene_name(),	Key.KEY_D, script___property_list_const.scene_path() )
	pam.add_lf()
	pam.add_split()
	build_summary( eSceneType.ROOT )
