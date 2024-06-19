extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Audio Root" )
	pam.add_split()
	pam.add_mover( "Playground",		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Stream Basic",		Key.KEY_1, "res://audio/audio_stream_basic.tscn" )
	pam.add_mover( "Stream Control",	Key.KEY_2, "res://audio/audio_stream_control.tscn" )
	build_summary( eSceneType.ROOT )
