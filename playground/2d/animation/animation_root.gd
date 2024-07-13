extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Animation Root" )
	pam.add_split()
	pam.add_mover( "2D Root",		Key.KEY_ESCAPE, "res://2d/2d_root.tscn" )
	pam.add_lf()
	pam.add_mover( "Basic",				Key.KEY_1, "res://2d/animation//animation_basic.tscn" )
	build_summary( eSceneType.ROOT )
