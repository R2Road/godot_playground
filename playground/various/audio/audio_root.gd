class_name audio_root extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Audio : Root"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_front( various_root.scene_name(),	Key.KEY_ESCAPE, "res://various/various_root.tscn" )
	pam.add_lf()
	pam.add_mover( "Stream Basic",		Key.KEY_1, "res://various/audio/audio_stream_basic.tscn" )
	pam.add_mover( "Stream Control",	Key.KEY_2, "res://various/audio/audio_stream_control.tscn" )
	pam.add_mover( "Stream Load",		Key.KEY_3, "res://various/audio/audio_stream_load.tscn" )
	pam.add_mover( "Stream Array",		Key.KEY_4, "res://various/audio/audio_stream_array.tscn" )
	pam.add_mover( "Stream Randomizer",	Key.KEY_5, "res://various/audio/audio_stream_randomizer.tscn" )
	build_summary( eSceneType.ROOT )
