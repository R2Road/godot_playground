extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Particles2D Root" )
	pam.add_split()
	pam.add_mover( "Playground",		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Basic",				Key.KEY_1, "res://particles2d/particles2d_cpu_shape.tscn" )
	pam.add_mover( "Control",			Key.KEY_2, "res://particles2d/particles2d_cpu_control.tscn" )
	pam.add_lf()
	pam.add_mover( "Demo 1",			Key.KEY_Z, "res://particles2d/particles2d_cpu_demo_1.tscn" )
	build_summary( eSceneType.ROOT )
