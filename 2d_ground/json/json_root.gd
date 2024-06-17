extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Json Root" )
	pam.add_split()
	pam.add_mover( "Playground",		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Container 2 Json String",		Key.KEY_1, "res://json/json_container_2_json_string.tscn" )
	pam.add_mover( "parse_string()",				Key.KEY_2, "res://json/json_parse_string.tscn" )
	build_summary( eSceneType.ROOT )
