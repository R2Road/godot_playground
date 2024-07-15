extends GDPTScene



############################ Variable ############################
var elapsed_time = 0



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
		var hp = GDPT.helper_point.instantiate()
		hp.set_position( $Path2D.curve.get_point_position( i ) )
		add_child( hp )
	
	$Label_1.text = ( "Baked Length : %.2f" % $Path2D.curve.get_baked_length() )
	$Label_1.set_position(
		Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.45 )
		- ( $Label_1.get_minimum_size() * $Label_1.get_scale() * 0.5 )
	)
	
	show_elapsed_time()


func _process( delta ):
	elapsed_time += delta
	
	if ( $Path2D.curve.point_count - 1 ) < elapsed_time:
		elapsed_time = 0
		
	$Player.position = $Path2D.curve.samplef( elapsed_time )
	
	show_elapsed_time()



############################   User   ############################
func show_elapsed_time():
	$Label_2.text = ( "Elapsed Time : %.2f" % elapsed_time )
	$Label_2.set_position(
		Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.55 )
		- ( $Label_2.get_minimum_size() * $Label_2.get_scale() * 0.5 )
	)
