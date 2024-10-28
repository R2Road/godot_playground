class_name playground_main extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "PlayGround | " + GDPT.version
	

static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_exit()
	pam.add_lf()
	pam.add_root( basic_root.scene_name(),		Key.KEY_1, 		basic_root.scene_path() )
	pam.add_root( input_root.scene_name(),		Key.KEY_2, 		input_root.scene_path() )
	pam.add_root( script_root.scene_name(),		Key.KEY_3, 		script_root.scene_path() )
	pam.add_root( resolution_root.scene_name(),	Key.KEY_4, 		resolution_root.scene_path() )
	pam.add_lf()
	pam.add_root( "2D", 			Key.KEY_Q, 		"res://2d/2d_root.tscn" )
	pam.add_root( "3D", 			Key.KEY_W, 		"res://3d/3d_root.tscn" )
	pam.add_root( "Control", 		Key.KEY_E, 		"res://control/control_root.tscn" )
	pam.add_lf()
	pam.add_root( various_root.scene_name(),	Key.KEY_A, various_root.scene_path() )
	pam.add_root( file_root.scene_name(),		Key.KEY_S, file_root.scene_path() )
	pam.add_root( editor_root.scene_name(),		Key.KEY_D, editor_root.scene_path() )
	pam.add_split()
	build_summary( eSceneType.ROOT )
