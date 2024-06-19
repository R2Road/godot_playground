extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Sound Root" )
	pam.add_split()
	pam.add_mover( "Playground",		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Stream Basic",		Key.KEY_1, "res://sound/sound_stream_basic.tscn" )
	build_summary( eSceneType.ROOT )
