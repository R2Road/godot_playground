class_name basic_root extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Basic Root"
	

static func scene_path()->String:
	return super.scene_path()


############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_front( playground_main.scene_name(),		Key.KEY_ESCAPE, playground_main.scene_path() )
	pam.add_lf()
	pam.add_mover( "Empty",  			Key.KEY_1, 		"res://basic/basic_empty.tscn" )
	pam.add_mover( "Dev Path",  		Key.KEY_2, 		"res://basic/basic_devpath.tscn" )
	pam.add_mover( "Log", 				Key.KEY_3, 		"res://basic/basic_log.tscn" )
	pam.add_mover( "Input", 			Key.KEY_4, 		"res://input/input_keyboard_in_input.tscn" )
	pam.add_lf()
	pam.add_mover( "Tree",  			Key.KEY_Q, 		"res://basic/basic_tree.tscn" )
	pam.add_mover( "Tree Order", 		Key.KEY_W, 		"res://basic/basic_tree_order.tscn" )
	pam.add_mover( "Get Node", 			Key.KEY_E, 		"res://basic/basic_getnode.tscn" )
	pam.add_mover( basic_child_sequence.scene_name(), 	Key.KEY_R, 		"res://basic/basic_child_sequence.tscn" )
	pam.add_mover( "Auto Load", 		Key.KEY_T, 		"res://basic/basic_autoload.tscn" )
	pam.add_lf()
	pam.add_mover( "Instantiate + Preload",		Key.KEY_A,	"res://basic/basic_instantiate_preload.tscn" )
	pam.add_mover( "Instantiate + Load",		Key.KEY_S,	"res://basic/basic_instantiate_load.tscn" )
	pam.add_mover( "Instantiate + PackedScene",	Key.KEY_D,	"res://basic/basic_instantiate_packedscene.tscn" )
	pam.add_mover( "Change Scene",				Key.KEY_F,	"res://basic/basic_change_scene.tscn" )
	pam.add_lf()
	pam.add_mover( "OS", 						Key.KEY_Z, 		"res://basic/basic_os.tscn" )
	pam.add_mover( "Directory View",			Key.KEY_X, 		"res://basic/basic_directory_view.tscn" )
	pam.add_mover( "Directory Generate/Remove",	Key.KEY_C, 		"res://basic/basic_directory_generate_remove.tscn" )
	pam.add_mover( "File Generate/Remove",		Key.KEY_V, 		"res://basic/basic_file_generate_remove.tscn" )
	build_summary( eSceneType.ROOT )
