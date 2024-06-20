extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Path2D Basic" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	for i in $Path2D.curve.point_count:
		var hp = ResourceLoader.load( "res://helper/helper_point.tscn" ).instantiate()
		hp.set_position( $Path2D.curve.get_point_position( i ) )
		add_child( hp )
	
	$Label.text = (
		"Baked Length : "
		+ str( $Path2D.curve.get_baked_length() )
	)
	$Label.set_position(
		( get_viewport().size * 0.5 )
		- ( $Label.get_minimum_size() * $Label.get_scale() * 0.5 )
	)
