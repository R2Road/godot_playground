extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Audio Root" )
	pam.add_split()
	pam.add_mover( playground_main.scene_name(),		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Stream Basic",		Key.KEY_1, "res://audio/audio_stream_basic.tscn" )
	pam.add_mover( "Stream Control",	Key.KEY_2, "res://audio/audio_stream_control.tscn" )
	pam.add_mover( "Stream Load",		Key.KEY_3, "res://audio/audio_stream_load.tscn" )
	pam.add_mover( "Stream Array",		Key.KEY_4, "res://audio/audio_stream_array.tscn" )
	pam.add_mover( "Stream Randomizer",	Key.KEY_5, "res://audio/audio_stream_randomizer.tscn" )
	build_summary( eSceneType.ROOT )
