class_name json_root extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Json : Root"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_front( file_root.scene_name(),	Key.KEY_ESCAPE, file_root.scene_path() )
	pam.add_lf()
	pam.add_mover( json___parse_string.scene_name(),			Key.KEY_1, json___parse_string.scene_path() )
	pam.add_mover( json___parse.scene_name(),					Key.KEY_2, json___parse.scene_path() )
	pam.add_mover( json_container_2_json_string.scene_name(),	Key.KEY_3, json_container_2_json_string.scene_path() )
	build_summary( eSceneType.ROOT )
