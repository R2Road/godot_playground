extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Animation Basic" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	$AnimatedSprite2D.set_position( get_viewport().size * 0.5 )
