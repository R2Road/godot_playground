extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "PlayGround" )
	pam.add_split()
	pam.add_exit()
	pam.add_lf()
	pam.add_mover( "Basic",			Key.KEY_1, 		"res://basic/basic_root.tscn" )
	pam.add_mover( "Input", 		Key.KEY_2, 		"res://input/input_root.tscn" )
	pam.add_mover( "Sprite", 		Key.KEY_3, 		"res://2d/sprite/sprite_root.tscn" )
	pam.add_mover( "Area2D", 		Key.KEY_4, 		"res://2d/area2d/area2d_root.tscn" )
	pam.add_mover( "RigidBody2D",	Key.KEY_5, 		"res://2d/rigidbody2d/rigidbody2d_root.tscn" )
	pam.add_mover( "Path2D",		Key.KEY_6, 		"res://2d/path2d/path2d_root.tscn" )
	pam.add_mover( "Animation",		Key.KEY_7, 		"res://2d/animation/animation_root.tscn" )
	pam.add_mover( "Particles2D",	Key.KEY_8, 		"res://2d/particles2d/particles2d_root.tscn" )
	pam.add_mover( "Tilemap",		Key.KEY_9, 		"res://2d/tilemap/tilemap_root.tscn" )
	pam.add_lf()
	pam.add_mover( "Camera2D",	Key.KEY_Q, 		"res://2d/camera2d/camera2d_root.tscn" )
	pam.add_mover( "Audio",		Key.KEY_W, 		"res://audio/audio_root.tscn" )
	pam.add_mover( "Json",		Key.KEY_E, 		"res://json/json_root.tscn" )
	pam.add_mover( "UI", 		Key.KEY_R, 		"res://2d/ui/ui_root.tscn" )
	pam.add_mover( "Shader",	Key.KEY_T, 		"res://2d/shader/shader_root.tscn" )
	pam.add_lf()
	pam.add_mover( "ETC",		Key.KEY_Z, 		"res://2d/etc/etc_root.tscn" )
	pam.add_mover( "Helper",	Key.KEY_X, 		"res://2d/helper/helper_root.tscn" )
	pam.add_split()
	build_summary( eSceneType.ROOT )
