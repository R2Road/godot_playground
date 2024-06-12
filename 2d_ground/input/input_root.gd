extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Input" )
	pam.add_split()
	pam.add_mover( "Playground",		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Keyboard Input", 	Key.KEY_1, 		"res://basic/gds_basic_input_keyboard.tscn" )
	build_summary( eSceneType.ROOT )
