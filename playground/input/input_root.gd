extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Input Root" )
	pam.add_split()
	pam.add_mover( playground_main.scene_name(),		Key.KEY_ESCAPE, playground_main.scene_path() )
	pam.add_lf()
	pam.add_mover( "Keyboard Input : In Input", 		Key.KEY_1, 		"res://input/input_keyboard_in_input.tscn" )
	pam.add_mover( "Keyboard Input : In Process", 		Key.KEY_2, 		"res://input/input_keyboard_in_process.tscn" )
	pam.add_mover( input_mouse_position.scene_name(), 	Key.KEY_3, 		"res://input/input_mouse_position.tscn" )
	pam.add_lf()
	pam.add_mover( "Input Map : In Project Setting",	Key.KEY_Q, 		"res://input/input_map_in_project_setting.tscn" )
	pam.add_mover( "Input Map : Show Actions",			Key.KEY_W, 		"res://input/input_map_show_actions.tscn" )
	pam.add_mover( "Input Map : Update Action Event",	Key.KEY_E, 		"res://input/input_map_update_action_event.tscn" )
	pam.add_mover( "Input Map : Update Action",			Key.KEY_R, 		"res://input/input_map_update_action.tscn" )
	build_summary( eSceneType.ROOT )
