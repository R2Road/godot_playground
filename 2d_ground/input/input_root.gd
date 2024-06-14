extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Input" )
	pam.add_split()
	pam.add_mover( "Playground",		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Keyboard Input : In Input", 	Key.KEY_1, 		"res://input/input_keyboard_in_input.tscn" )
	pam.add_mover( "Keyboard Input : In Process", 	Key.KEY_2, 		"res://input/input_keyboard_in_process.tscn" )
	pam.add_mover( "Map", 							Key.KEY_3, 		"res://input/input_map.tscn" )
	build_summary( eSceneType.ROOT )
