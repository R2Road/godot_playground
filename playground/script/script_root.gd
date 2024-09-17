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
	pam.add_mover( script_stack.scene_name(),		Key.KEY_1, "res://script/script_stack.tscn" )
	pam.add_mover( script_path.scene_name(),		Key.KEY_2, "res://script/script_path.tscn" )
	pam.add_lf()
	pam.add_split()
	build_summary( eSceneType.ROOT )
