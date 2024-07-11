extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "3D Root" )
	pam.add_split()
	pam.add_mover( "Playground",		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	
	
	
	pam.add_split()
	build_summary( eSceneType.ROOT )
