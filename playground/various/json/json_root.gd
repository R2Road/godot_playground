class_name json_root extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Json : Root"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( json_root.scene_name() )
	pam.add_split()
	pam.add_mover( various_root.scene_name(),	Key.KEY_ESCAPE, "res://various/various_root.tscn" )
	pam.add_lf()
	pam.add_mover( "parse_string()",				Key.KEY_1, "res://various/json/json_parse_string.tscn" )
	pam.add_mover( "parse()",						Key.KEY_2, "res://various/json/json_parse.tscn" )
	pam.add_mover( "Container 2 Json String",		Key.KEY_3, "res://various/json/json_container_2_json_string.tscn" )
	build_summary( eSceneType.ROOT )
