class_name playground_main extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "PlayGround <" + GDPT.version + ">"



############################ Override ############################
func _ready():
	pam.set_name( playground_main.scene_name() )
	pam.add_split()
	pam.add_exit()
	pam.add_lf()
	pam.add_mover( "Basic",			Key.KEY_1, 		"res://basic/basic_root.tscn" )
	pam.add_mover( "Input", 		Key.KEY_2, 		"res://input/input_root.tscn" )
	pam.add_mover( script_root.scene_name(),	Key.KEY_3, 		"res://script/script_root.tscn" )
	pam.add_lf()
	pam.add_mover( "2D", 			Key.KEY_Q, 		"res://2d/2d_root.tscn" )
	pam.add_mover( "3D", 			Key.KEY_W, 		"res://3d/3d_root.tscn" )
	pam.add_mover( "Control", 		Key.KEY_E, 		"res://control/control_root.tscn" )
	pam.add_lf()
	pam.add_mover( various_root.scene_name(),	Key.KEY_A, "res://various/various_root.tscn" )
	pam.add_split()
	build_summary( eSceneType.ROOT )
