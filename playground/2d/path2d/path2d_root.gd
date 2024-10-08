extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Path2D Root" )
	pam.add_split()
	pam.add_front( "2D Root",		Key.KEY_ESCAPE, "res://2d/2d_root.tscn" )
	pam.add_lf()
	pam.add_mover( "Basic",			Key.KEY_1, "res://2d/path2d/path2d_basic.tscn" )
	pam.add_mover( "Load",			Key.KEY_2, "res://2d/path2d/path2d_load.tscn" )
	pam.add_mover( "In/Out",		Key.KEY_3, "res://2d/path2d/path2d_in_out.tscn" )
	pam.add_mover( "Follow",		Key.KEY_4, "res://2d/path2d/path2d_follow.tscn" )
	build_summary( eSceneType.ROOT )
