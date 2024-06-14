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
	pam.add_mover( "UI", 		Key.KEY_5, 		"res://ui/ui_root.tscn" )
	pam.add_mover( "Sound",		Key.KEY_6, 		"res://sound/sound_root.tscn" )
	pam.add_split()
	pam.add_mover( "Test change scene without PlaygroundScene",	Key.KEY_SPACE,	"res://dummy.tscn" )
	build_summary( eSceneType.ROOT )
