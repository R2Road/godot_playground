extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Helper Root" )
	pam.add_split()
	pam.add_mover( "2D Root",		Key.KEY_ESCAPE, "res://2d/2d_root.tscn" )
	build_summary( eSceneType.TEST )
