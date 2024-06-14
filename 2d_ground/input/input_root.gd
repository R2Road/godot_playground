extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Input Root" )
	pam.add_split()
	pam.add_mover( "Playground",		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Keyboard Input : In Input", 		Key.KEY_1, 		"res://input/input_keyboard_in_input.tscn" )
	pam.add_mover( "Keyboard Input : In Process", 		Key.KEY_2, 		"res://input/input_keyboard_in_process.tscn" )
	pam.add_lf()
	pam.add_mover( "Input Map : In Project Setting",	Key.KEY_Q, 		"res://input/input_map_in_project_setting.tscn" )
	pam.add_mover( "Input Map : Actions",				Key.KEY_W, 		"res://input/input_map_actions.tscn" )
	pam.add_mover( "Input Map : Update Action Event",	Key.KEY_E, 		"res://input/input_map_update_action_event.tscn" )
	pam.add_mover( "Input Map : Update Action",			Key.KEY_R, 		"res://input/input_map_update_action.tscn" )
	build_summary( eSceneType.ROOT )
