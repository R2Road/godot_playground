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
	pam.add_lf()
	pam.add_split()
	build_summary( eSceneType.ROOT )
