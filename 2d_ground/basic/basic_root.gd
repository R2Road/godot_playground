extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "GD Script Basic" )
	pam.add_split()
	pam.add_mover( "Playground",		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Empty",  			Key.KEY_1, 		"res://basic/basic_empty.tscn" )
	pam.add_mover( "Dev Path",  		Key.KEY_2, 		"res://basic/basic_devpath.tscn" )
	pam.add_mover( "Tree",  			Key.KEY_3, 		"res://basic/basic_tree.tscn" )
	pam.add_mover( "Tree Order", 		Key.KEY_4, 		"res://basic/basic_tree_order.tscn" )
	pam.add_mover( "Log", 				Key.KEY_5, 		"res://basic/basic_log.tscn" )
	pam.add_mover( "Keyboard Input", 	Key.KEY_6, 		"res://input/input_keyboard_in_input.tscn" )
	pam.add_mover( "Get Node", 			Key.KEY_7, 		"res://basic/basic_getnode.tscn" )
	pam.add_lf()
	pam.add_mover( "Change Scene",		Key.KEY_Q,	"res://basic/basic_change_scene.tscn" )
	pam.add_lf()
	pam.add_mover( "Instantiate + Preload",		Key.KEY_A,	"res://basic/basic_instantiate_preload.tscn" )
	pam.add_mover( "Instantiate + Load",		Key.KEY_S,	"res://basic/basic_instantiate_load.tscn" )
	pam.add_mover( "Instantiate + PackedScene",	Key.KEY_D,	"res://basic/basic_instantiate_packedscene.tscn" )
	pam.add_lf()
	pam.add_mover( "OS", 				Key.KEY_Z, 		"res://basic/basic_os.tscn" )
	build_summary( eSceneType.ROOT )
