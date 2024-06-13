extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Animation Control" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "Play Ani 1", Key.KEY_A, play_ani_1 )
	pam.add_action( "Play Ani 2", Key.KEY_S, play_ani_2 )
	pam.add_action( "Stop Ani", Key.KEY_D, stop_ani )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	$AnimatedSprite2D.set_position( get_viewport().size * 0.5 )



############################   User   ############################
func play_ani_1():
	$AnimatedSprite2D.play( "ani_1" )
func play_ani_2():
	$AnimatedSprite2D.play( "ani_2" )
func stop_ani():
	$AnimatedSprite2D.stop()
