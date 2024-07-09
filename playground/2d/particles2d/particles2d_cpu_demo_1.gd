extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Particles2D : CPU : Demo 1" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	$CPUParticles2D_Shape_Rectangle.position = (
		get_viewport().size * 0.5
		- $CPUParticles2D_Shape_Rectangle.emission_rect_extents
	)
	
	$CPUParticles2D_Shape_Rectangle/helper_rect.color = Color.GRAY
	$CPUParticles2D_Shape_Rectangle/helper_rect.rect = Rect2(
		-$CPUParticles2D_Shape_Rectangle.emission_rect_extents
		, $CPUParticles2D_Shape_Rectangle.emission_rect_extents * 2
	)
	
	# Guide
	$helper_rect.position = ( get_viewport().size * 0.5 )
	$helper_rect.rect = Rect2(
		-$CPUParticles2D_Shape_Rectangle.emission_rect_extents
		, $CPUParticles2D_Shape_Rectangle.emission_rect_extents * 2
	)



############################   User   ############################
