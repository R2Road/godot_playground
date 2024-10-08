extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "2D Root" )
	pam.add_split()
	pam.add_front( playground_main.scene_name(),		Key.KEY_ESCAPE, playground_main.scene_path() )
	pam.add_lf()
	pam.add_root( "Sprite", 		Key.KEY_1, 		"res://2d/sprite/sprite_root.tscn" )
	pam.add_root( "Area2D", 		Key.KEY_2, 		"res://2d/area2d/area2d_root.tscn" )
	pam.add_root( "RigidBody2D",	Key.KEY_3, 		"res://2d/rigidbody2d/rigidbody2d_root.tscn" )
	pam.add_root( "Path2D",			Key.KEY_4, 		"res://2d/path2d/path2d_root.tscn" )
	pam.add_root( "Animation",		Key.KEY_5, 		"res://2d/animation/animation_root.tscn" )
	pam.add_root( "Particles2D",	Key.KEY_6, 		"res://2d/particles2d/particles2d_root.tscn" )
	pam.add_root( "Tilemap",		Key.KEY_7, 		"res://2d/tilemap/tilemap_root.tscn" )
	pam.add_lf()
	pam.add_root( "Camera2D",	Key.KEY_Q, 		"res://2d/camera2d/camera2d_root.tscn" )
	pam.add_root( "Shader",		Key.KEY_W, 		"res://2d/shader/shader_root.tscn" )
	pam.add_lf()
	pam.add_root( "ETC",		Key.KEY_Z, 		"res://2d/etc/etc_root.tscn" )
	pam.add_split()
	build_summary( eSceneType.ROOT )
