extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "PlayGround" )
	pam.add_split()
	pam.add_exit()
	pam.add_lf()
	pam.add_mover( "Basic",			Key.KEY_1, 		"res://basic/basic_root.tscn" )
	pam.add_mover( "Input", 		Key.KEY_2, 		"res://input/input_root.tscn" )
	pam.add_lf()
	pam.add_mover( "2D", 			Key.KEY_Q, 		"res://2d/2d_root.tscn" )
	pam.add_mover( "3D", 			Key.KEY_W, 		"res://3d/3d_root.tscn" )
	pam.add_lf()
	pam.add_mover( "Audio",		Key.KEY_A, 		"res://audio/audio_root.tscn" )
	pam.add_mover( "Json",		Key.KEY_S, 		"res://json/json_root.tscn" )
	pam.add_split()
	build_summary( eSceneType.ROOT )
