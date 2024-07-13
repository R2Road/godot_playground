extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Particles2D : CPU : Control" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "Gravity : 0",		Key.KEY_1, ( func() : set_gravity( 0 ) ) )
	pam.add_action( "Gravity : -500",	Key.KEY_2, ( func() : set_gravity( -500 ) ) )
	pam.add_lf()
	pam.add_action( "Scale Amount Max : 1",	Key.KEY_Q, ( func() : set_scale_amount_max( 1 ) ) )
	pam.add_action( "Scale Amount Max : 8",	Key.KEY_W, ( func() : set_scale_amount_max( 8 ) ) )
	pam.add_lf()
	pam.add_action( "Color : White",	Key.KEY_A, ( func() : set_color( Color.WHITE ) ) )
	pam.add_action( "Color : Red",		Key.KEY_S, ( func() : set_color( Color.RED ) ) )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	$CPUParticles2D_Shape_Point.position = Vector2( get_viewport().size.x * 0.25, get_viewport().size.y * 0.7 )
	
	$CPUParticles2D_Shape_Rectangle.position = Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.7 )
	
	$CPUParticles2D_Shape_Sphere.position = Vector2( get_viewport().size.x * 0.75, get_viewport().size.y * 0.7 )



############################   User   ############################
func set_gravity( gravity ):
	$CPUParticles2D_Shape_Point.gravity = Vector2( 0, gravity )
	$CPUParticles2D_Shape_Rectangle.gravity = Vector2( 0, gravity )
	$CPUParticles2D_Shape_Sphere.gravity = Vector2( 0, gravity )

func set_scale_amount_max( amount ):
	$CPUParticles2D_Shape_Point.scale_amount_max = amount
	$CPUParticles2D_Shape_Rectangle.scale_amount_max = amount
	$CPUParticles2D_Shape_Sphere.scale_amount_max = amount

func set_color( color ):
	$CPUParticles2D_Shape_Point.color = color
	$CPUParticles2D_Shape_Rectangle.color = color
	$CPUParticles2D_Shape_Sphere.color = color
