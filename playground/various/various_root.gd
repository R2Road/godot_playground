class_name various_root extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Various Root"



############################ Override ############################
func _ready():
	pam.set_name( various_root.scene_name() )
	pam.add_split()
	pam.add_mover( playground_main.scene_name(),	Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Audio",		Key.KEY_A, 		"res://various/audio/audio_root.tscn" )
	pam.add_mover( "Json",		Key.KEY_S, 		"res://various/json/json_root.tscn" )
	pam.add_mover( config_root.scene_name(),		Key.KEY_D, 		"res://various/config/config_root.tscn" )
	pam.add_mover( inspector_struct.scene_name(),	Key.KEY_F, 		"res://various/inspector/inspector_struct.tscn" )
	pam.add_split()
	build_summary( eSceneType.ROOT )
