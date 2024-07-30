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
	pam.add_mover( "Audio",		Key.KEY_A, 		"res://audio/audio_root.tscn" )
	pam.add_mover( "Json",		Key.KEY_S, 		"res://json/json_root.tscn" )
	pam.add_mover( config_root.scene_name(),	Key.KEY_D, 		"res://config/config_root.tscn" )
	pam.add_mover( inspector_struct.scene_name(),	Key.KEY_F, 		"res://inspector/inspector_struct.tscn" )
	pam.add_split()
	build_summary( eSceneType.ROOT )
