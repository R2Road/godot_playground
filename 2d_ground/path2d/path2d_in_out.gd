extends PlaygroundScene



############################ Variable ############################
var elapsed_time_1 = 0
var elapsed_time_2 = 0
var elapsed_time_3 = 0



############################ Override ############################
func _ready():
	pam.set_name( "Path2D : In/Out" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	
	#
	# Start Practice
	#
	
	# 1
	var path2d = Path2D.new()
	path2d.name = "Path2D_1"
	add_child( path2d )
	
	var y = get_viewport().size.y * 0.2
	$Path2D_1.curve = Curve2D.new()
	$Path2D_1.curve.add_point( Vector2( 150, y ) )
	$Path2D_1.curve.add_point( Vector2( get_viewport().size.x * 0.5, y ) )
	$Path2D_1.curve.add_point( Vector2( get_viewport().size.x - 150, y ) )
	
	show_path( $Path2D_1 )
	
	$Label_1.position = Vector2( get_viewport().size.x * 0.5, y )
	
	
	# 2
	path2d = Path2D.new()
	path2d.name = "Path2D_2"
	add_child( path2d )
	
	y = get_viewport().size.y * 0.5
	$Path2D_2.curve = Curve2D.new()
	$Path2D_2.curve.add_point( Vector2( 150, y ) )
	$Path2D_2.curve.add_point( Vector2( get_viewport().size.x * 0.5, y ), Vector2( -50, 70 ) )
	$Path2D_2.curve.add_point( Vector2( get_viewport().size.x - 150, y ) )
	
	show_path( $Path2D_2 )
	
	$Label_2.position = Vector2( get_viewport().size.x * 0.5, y )
	
	
	# 3
	path2d = Path2D.new()
	path2d.name = "Path2D_3"
	add_child( path2d )
	
	y = get_viewport().size.y * 0.8
	$Path2D_3.curve = Curve2D.new()
	$Path2D_3.curve.add_point( Vector2( 150, y ) )
	$Path2D_3.curve.add_point( Vector2( get_viewport().size.x * 0.5, y ), Vector2( -50, 70 ), Vector2( 50, -70 ) )
	$Path2D_3.curve.add_point( Vector2( get_viewport().size.x - 150, y ) )
	
	show_path( $Path2D_3 )
	
	$Label_3.position = Vector2( get_viewport().size.x * 0.5, y )


func _process( delta ):
	elapsed_time_1 += delta
	if ( $Path2D_1.curve.point_count - 1 ) < elapsed_time_1:
		elapsed_time_1 = 0
	$Player_1.position = $Path2D_1.curve.samplef( elapsed_time_1 )
	
	elapsed_time_2 += delta
	if ( $Path2D_2.curve.point_count - 1 ) < elapsed_time_2:
		elapsed_time_2 = 0
	$Player_2.position = $Path2D_2.curve.samplef( elapsed_time_2 )
	
	elapsed_time_3 += delta
	if ( $Path2D_3.curve.point_count - 1 ) < elapsed_time_3:
		elapsed_time_3 = 0
	$Player_3.position = $Path2D_3.curve.samplef( elapsed_time_3 )



############################   User   ############################
func show_path( path2d : Path2D ):
	for i in path2d.curve.point_count:
		var hp = ResourceLoader.load( "res://helper/helper_point.tscn" ).instantiate()
		hp.set_position( path2d.curve.get_point_position( i ) )
		add_child( hp )
		
		if Vector2.ZERO != path2d.curve.get_point_in( i ):
			var ip = hp.duplicate()
			ip.color = Color( 1, 0, 0 )
			ip.set_position( hp.position + path2d.curve.get_point_in( i ) )
			add_child( ip )
			
		if Vector2.ZERO != path2d.curve.get_point_out( i ):
			var op = hp.duplicate()
			op.color = Color( 0, 0, 1 )
			op.set_position( hp.position + path2d.curve.get_point_out( i ) )
			add_child( op )	
