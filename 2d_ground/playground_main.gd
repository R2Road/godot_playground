extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "PlayGround" )
	pam.add_split()
	pam.add_exit()
	pam.add_lf()
	pam.add_mover( "Basic",		Key.KEY_1, 		"res://gds_basic/gds_basic_root.tscn" )
	pam.add_mover( "Input", 	Key.KEY_2, 		"res://gds_input/gds_input_root.tscn" )
	pam.add_mover( "Sprite", 	Key.KEY_3, 		"res://gds_sprite/gds_sprite_root.tscn" )
	pam.add_mover( "UI", 		Key.KEY_4, 		"res://gds_ui/gds_ui_root.tscn" )
	pam.add_mover( "Sound",		Key.KEY_5, 		"res://gds_sound/gds_sound_root.tscn" )
	pam.add_split()
	pam.add_mover( "Test change scene without PlaygroundScene",	Key.KEY_SPACE,	"res://dummy.tscn" )
	build_summary( eSceneType.ROOT )
