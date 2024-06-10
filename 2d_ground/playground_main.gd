extends PlaygroundScene



############################ Override ############################
func _init():
	super._init()
	
	scene_type = eSceneType.ROOT
	
	pam.set_name( "PlayGround" )
	pam.add_mover( "Exit",	Key.KEY_ESCAPE,	"res://playground_exit.tscn" )
	pam.add_lf()
	pam.add_mover( "Basic",	Key.KEY_1, 		"res://gds_basic/gds_basic_root.tscn" )
	pam.add_mover( "UI", 	Key.KEY_2, 		"res://gds_ui/gds_ui_root.tscn" )
	pam.add_mover( "Sound",	Key.KEY_3, 		"res://gds_sound/gds_sound_root.tscn" )
