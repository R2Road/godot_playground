class_name config_root extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Config Root"



############################ Override ############################
func _ready():
	pam.set_name( config_root.scene_name() )
	pam.add_split()
	pam.add_mover( playground_main.scene_name(),		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	build_summary( eSceneType.ROOT )
