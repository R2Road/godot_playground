class_name tween_root extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Tween Root"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_lf()
	pam.add_front( playground_main.scene_name(),	Key.KEY_ESCAPE, playground_main.scene_path() )
	pam.add_lf()
	pam.add_mover( tween__basic.scene_name(),	Key.KEY_1, tween__basic.scene_path() )
	pam.add_lf()
	pam.add_lf()
	pam.add_mover( tween__shake.scene_name(),	Key.KEY_Q, tween__shake.scene_path() )
	pam.add_split()
	build_summary( eSceneType.ROOT )
