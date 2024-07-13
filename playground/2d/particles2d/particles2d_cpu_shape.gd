extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Particles2D : CPU Shape" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	$CPUParticles2D_Shape_Point.position = Vector2( get_viewport().size.x * 0.25, get_viewport().size.y * 0.7 )
	
	$CPUParticles2D_Shape_Rectangle.position = Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.7 )
	
	$CPUParticles2D_Shape_Sphere.position = Vector2( get_viewport().size.x * 0.75, get_viewport().size.y * 0.7 )
