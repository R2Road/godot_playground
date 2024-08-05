class_name config_root extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Config Root"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( config_root.scene_name() )
	pam.add_split()
	pam.add_mover( various_root.scene_name(),	Key.KEY_ESCAPE, "res://various/various_root.tscn" )
	pam.add_lf()
	pam.add_mover( config_section.scene_name(),		Key.KEY_1, "res://various/config/config_section.tscn" )
	pam.add_mover( config_parse.scene_name(),		Key.KEY_2, "res://various/config/config_parse.tscn" )
	pam.add_split()
	build_summary( eSceneType.ROOT )
