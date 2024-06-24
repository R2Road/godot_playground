extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Particles2D : CPU Shape" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "Gravity On/Off", Key.KEY_1, gravity_toggle )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	$CPUParticles2D_Shape_Point.position = Vector2( get_viewport().size.x * 0.25, get_viewport().size.y * 0.7 )
	
	$CPUParticles2D_Shape_Rectangle.position = Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.7 )
	
	$CPUParticles2D_Shape_Sphere.position = Vector2( get_viewport().size.x * 0.75, get_viewport().size.y * 0.7 )



############################   User   ############################
func gravity_toggle():
	if Vector2.ZERO == $CPUParticles2D_Shape_Point.gravity:
		$CPUParticles2D_Shape_Point.gravity = Vector2( 0, -500 )
		$CPUParticles2D_Shape_Rectangle.gravity = Vector2( 0, -500 )
		$CPUParticles2D_Shape_Sphere.gravity = Vector2( 0, -500 )
	else:
		$CPUParticles2D_Shape_Point.gravity = Vector2.ZERO
		$CPUParticles2D_Shape_Rectangle.gravity = Vector2.ZERO
		$CPUParticles2D_Shape_Sphere.gravity = Vector2.ZERO
