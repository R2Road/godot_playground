class_name config_root extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Config Root"



############################ Override ############################
func _ready():
	pam.set_name( config_root.scene_name() )
	pam.add_split()
	pam.add_mover( playground_main.scene_name(),		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( config_section.scene_name(),		Key.KEY_1, "res://config/config_section.tscn" )
	pam.add_mover( config_parse.scene_name(),		Key.KEY_2, "res://config/config_parse.tscn" )
	pam.add_split()
	build_summary( eSceneType.ROOT )
