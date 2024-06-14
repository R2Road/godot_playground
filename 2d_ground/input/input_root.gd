extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Input Root" )
	pam.add_split()
	pam.add_mover( "Playground",		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Keyboard Input : In Input", 		Key.KEY_1, 		"res://input/input_keyboard_in_input.tscn" )
	pam.add_mover( "Keyboard Input : In Process", 		Key.KEY_2, 		"res://input/input_keyboard_in_process.tscn" )
	pam.add_mover( "Input Map : In Project Setting",	Key.KEY_3, 		"res://input/input_map_in_project_setting.tscn" )
	pam.add_mover( "Input Map : Actions",				Key.KEY_4, 		"res://input/input_map_actions.tscn" )
	build_summary( eSceneType.ROOT )
