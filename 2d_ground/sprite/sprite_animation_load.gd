extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Animation Load" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	$AnimatedSprite2D_1.set_position( get_viewport().size * 0.25 )
	$AnimatedSprite2D_1.sprite_frames.set_animation_loop( "ani_1", true )
	$AnimatedSprite2D_1.play( "ani_1" )
	
	$AnimatedSprite2D_2.set_position( get_viewport().size * 0.5 )
	$AnimatedSprite2D_2.sprite_frames = load( "res://resources/sprite/actor001/sprite2d_animation_actor001.tres" )
	$AnimatedSprite2D_1.sprite_frames.set_animation_loop( "ani_2", true )
	$AnimatedSprite2D_2.play( "ani_2" )
