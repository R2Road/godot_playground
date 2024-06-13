extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Sheet" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "Increase Sprite Frame", Key.KEY_A, increase_frame )
	pam.add_action( "Decrease Sprite Frame", Key.KEY_S, decrease_frame )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	$Sprite2D.set_position( get_viewport().size * 0.5 )
	
	update_frame_view( $Sprite2D.frame )



############################   User   ############################
func increase_frame():
	var new_frame = ( ( $Sprite2D.frame + 1 ) % $Sprite2D.hframes )
	
	$Sprite2D.frame = new_frame
	update_frame_view( $Sprite2D.frame )

func decrease_frame():
	var new_frame = ( ( $Sprite2D.hframes - 1 ) if ( 0 == $Sprite2D.frame ) else ( $Sprite2D.frame - 1 ) )
	
	$Sprite2D.frame = new_frame
	update_frame_view( $Sprite2D.frame )

func update_frame_view( frame : int ):
	$Sprite2D/Label.text = ( "frame : " + str( frame ) )
