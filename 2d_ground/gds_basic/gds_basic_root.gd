extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "GD Script Basic" )
	pam.add_split()
	pam.add_mover( "Playground",		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Empty",  			Key.KEY_1, 		"res://gds_basic/gds_basic_empty.tscn" )
	pam.add_mover( "Dev Path",  		Key.KEY_2, 		"res://gds_basic/gds_basic_devpath.tscn" )
	pam.add_mover( "Tree",  			Key.KEY_3, 		"res://gds_basic/gds_basic_tree.tscn" )
	pam.add_mover( "OS", 				Key.KEY_4, 		"res://gds_basic/gds_basic_os.tscn" )
	pam.add_mover( "Tree Order", 		Key.KEY_5, 		"res://gds_basic/gds_basic_tree_order.tscn" )
	pam.add_mover( "Log", 				Key.KEY_6, 		"res://gds_basic/gds_basic_log.tscn" )
	pam.add_mover( "Keyboard Input", 	Key.KEY_7, 		"res://gds_basic/gds_basic_input_keyboard.tscn" )
	pam.add_mover( "Get Node", 			Key.KEY_8, 		"res://gds_basic/gds_basic_getnode.tscn" )
	build_summary( eSceneType.ROOT )
