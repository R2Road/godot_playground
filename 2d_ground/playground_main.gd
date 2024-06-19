extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "PlayGround" )
	pam.add_split()
	pam.add_exit()
	pam.add_lf()
	pam.add_mover( "Basic",		Key.KEY_1, 		"res://basic/basic_root.tscn" )
	pam.add_mover( "Input", 	Key.KEY_2, 		"res://input/input_root.tscn" )
	pam.add_mover( "Sprite", 	Key.KEY_3, 		"res://sprite/sprite_root.tscn" )
	pam.add_mover( "Area2D", 	Key.KEY_4, 		"res://area2d/area2d_root.tscn" )
	pam.add_mover( "RigidBody2D",	Key.KEY_5, 		"res://rigidbody2d/rigidbody2d_root.tscn" )
	pam.add_mover( "UI", 		Key.KEY_6, 		"res://ui/ui_root.tscn" )
	pam.add_mover( "Audio",		Key.KEY_7, 		"res://audio/audio_root.tscn" )
	pam.add_lf()
	pam.add_mover( "Json",		Key.KEY_Q, 		"res://json/json_root.tscn" )
	pam.add_lf()
	pam.add_mover( "ETC",		Key.KEY_Z, 		"res://etc/etc_root.tscn" )
	pam.add_mover( "Helper",	Key.KEY_X, 		"res://helper/helper_root.tscn" )
	pam.add_split()
	pam.add_mover( "Test change scene without PlaygroundScene",	Key.KEY_SPACE,	"res://dummy.tscn" )
	build_summary( eSceneType.ROOT )
