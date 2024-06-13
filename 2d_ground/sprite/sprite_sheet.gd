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
	
	update_frame( $Sprite2D.frame )



############################   User   ############################
func increase_frame():
	var new_frame = ( ( $Sprite2D.frame + 1 ) % $Sprite2D.hframes )
	
	update_frame( new_frame )

func decrease_frame():
	var new_frame = ( ( $Sprite2D.hframes - 1 ) if ( 0 == $Sprite2D.frame ) else ( $Sprite2D.frame - 1 ) )
	
	update_frame( new_frame )

func update_frame( new_frame : int ):
	$Sprite2D.frame = new_frame
	$Sprite2D/Label.text = ( "frame : " + str( new_frame ) )
