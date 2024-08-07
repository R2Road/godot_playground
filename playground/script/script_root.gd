class_name script_root extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Script Root"



############################ Override ############################
func _ready():
	pam.set_name( script_root.scene_name() )
	pam.add_split()
	pam.add_lf()
	pam.add_mover( playground_main.scene_name(),	Key.KEY_ESCAPE, playground_main.scene_path() )
	pam.add_lf()
	pam.add_mover( script_stack.scene_name(),		Key.KEY_1, "res://script/script_stack.tscn" )
	pam.add_mover( script_path.scene_name(),		Key.KEY_2, "res://script/script_path.tscn" )
	pam.add_lf()
	pam.add_split()
	build_summary( eSceneType.ROOT )
