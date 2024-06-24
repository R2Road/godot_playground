extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Particles2D Root" )
	pam.add_split()
	pam.add_mover( "Playground",		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Basic",				Key.KEY_1, "res://particles2d/particles2d_cpu_shape.tscn" )
	build_summary( eSceneType.ROOT )
