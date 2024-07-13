extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Animation Control" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "Stop Ani", Key.KEY_1, stop_ani )
	pam.add_lf()
	pam.add_action( "Play Repeat : Ani 1", Key.KEY_Q, ( func(): play_ani( "ani_1" ) ) )
	pam.add_action( "Play Repeat : Ani 2", Key.KEY_W, ( func(): play_ani( "ani_2" ) ) )
	pam.add_lf()
	pam.add_action( "Play Once : Ani 1", Key.KEY_A, ( func(): play_ani_once( "ani_1" ) ) )
	pam.add_action( "Play Once : Ani 2", Key.KEY_S, ( func(): play_ani_once( "ani_2" ) ) )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	$AnimatedSprite2D.set_position( get_viewport().size * 0.5 )



############################   User   ############################
func play_ani( ani : String ):
	$AnimatedSprite2D.sprite_frames.set_animation_loop( ani, true )
	$AnimatedSprite2D.play( ani )

func stop_ani():
	$AnimatedSprite2D.stop()

func play_ani_once( ani : String ):
	$AnimatedSprite2D.sprite_frames.set_animation_loop( ani, false )
	$AnimatedSprite2D.play( ani )
