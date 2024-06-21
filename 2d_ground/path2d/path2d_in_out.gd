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
	$Path2D_1.curve.add_point( Vector2( get_viewport().size.x - 100, y ) )
	
	for i in $Path2D_1.curve.point_count:
		var hp = ResourceLoader.load( "res://helper/helper_point.tscn" ).instantiate()
		hp.set_position( $Path2D_1.curve.get_point_position( i ) )
		add_child( hp )
	
	
	# 2
	path2d = Path2D.new()
	path2d.name = "Path2D_2"
	add_child( path2d )
	
	y = get_viewport().size.y * 0.5
	$Path2D_2.curve = Curve2D.new()
	$Path2D_2.curve.add_point( Vector2( 150, y ) )
	$Path2D_2.curve.add_point( Vector2( get_viewport().size.x * 0.5, y ), Vector2( -50, 100 ) )
	$Path2D_2.curve.add_point( Vector2( get_viewport().size.x - 100, y ) )
	
	for i in $Path2D_2.curve.point_count:
		var hp = ResourceLoader.load( "res://helper/helper_point.tscn" ).instantiate()
		hp.set_position( $Path2D_2.curve.get_point_position( i ) )
		add_child( hp )
	
	
	# 3
	path2d = Path2D.new()
	path2d.name = "Path2D_3"
	add_child( path2d )
	
	y = get_viewport().size.y * 0.8
	$Path2D_3.curve = Curve2D.new()
	$Path2D_3.curve.add_point( Vector2( 150, y ) )
	$Path2D_3.curve.add_point( Vector2( get_viewport().size.x * 0.5, y ), Vector2( -50, 100 ), Vector2( 50, -100 ) )
	$Path2D_3.curve.add_point( Vector2( get_viewport().size.x - 100, y ) )
	
	for i in $Path2D_3.curve.point_count:
		var hp = ResourceLoader.load( "res://helper/helper_point.tscn" ).instantiate()
		hp.set_position( $Path2D_3.curve.get_point_position( i ) )
		add_child( hp )


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
