extends GDPTScene



############################ Variable ############################
var elapsed_time = 0



############################ Override ############################
func _ready():
	pam.set_name( "Path2D Load" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	var path2d = Path2D.new()
	path2d.name = "Path2D"
	add_child( path2d )
	
	$Path2D.curve = Curve2D.new()
	$Path2D.curve.add_point( Vector2( 150, 100 ) )
	$Path2D.curve.add_point( Vector2( get_viewport().size.x - 100, 100 ) )
	$Path2D.curve.add_point( Vector2( get_viewport().size.x - 100, get_viewport().size.y - 100 ) )
	$Path2D.curve.add_point( Vector2( 100, get_viewport().size.y - 100 ) )
	$Path2D.curve.add_point( Vector2( 100, 150 ) )
	
	for i in $Path2D.curve.point_count:
		var hp = GDPT.helper_point.instantiate()
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


func _process( delta ):
	elapsed_time += delta
	
	if ( $Path2D.curve.point_count - 1 ) < elapsed_time:
		elapsed_time = 0
		
	$Player.position = $Path2D.curve.samplef( elapsed_time )
