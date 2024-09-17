extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Shader Root" )
	pam.add_split()
	pam.add_front( "2D Root",		Key.KEY_ESCAPE, "res://2d/2d_root.tscn" )
	build_summary( eSceneType.ROOT )
