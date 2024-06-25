extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "ETC : Pause" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "pause", Key.KEY_1, func() : set_pause( true ) )
	pam.add_action( "resume", Key.KEY_2, func() : set_pause( false ) )
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


func _exit_tree():
	set_pause( false )



############################   User   ############################
func set_pause( flag : bool ):
	get_tree().paused = flag
