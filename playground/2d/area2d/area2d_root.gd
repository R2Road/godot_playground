extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Area2D Root" )
	pam.add_split()
	pam.add_mover( "Playground",		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Basic",	Key.KEY_1, "res://2d/area2d/area2d_basic.tscn" )
	pam.add_mover( "Load",	Key.KEY_2, "res://2d/area2d/area2d_load.tscn" )
	pam.add_mover( "Connect Signal in Script",	Key.KEY_3, "res://2d/area2d/area2d_connect_signal_in_script.tscn" )
	build_summary( eSceneType.ROOT )
