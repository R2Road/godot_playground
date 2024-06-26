extends PlaygroundScene



############################ Variable ############################
const move_speed : int = 200



############################ Override ############################
func _ready():
	pam.set_name( "ViewPort" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "Add Camera", Key.KEY_1, add_camera )
	pam.add_message( "[ W | A | S | D ] Move Camera( Add Camera First )" )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	$helper_point.position = ( get_viewport().size * 0.5 )
	$Label.position = (
		( get_viewport().size * 0.5 )
		- ( $Label.get_minimum_size() * $Label.get_scale() * 0.5 )		
	)


func _physics_process( delta ):
	if null == get_viewport().get_camera_2d():
		return
	
	var move_vec : Vector2 = Vector2.ZERO
	
	if Input.is_key_pressed( KEY_W ):
		move_vec.y -= 1
	if Input.is_key_pressed( KEY_S ):
		move_vec.y += 1
	if Input.is_key_pressed( KEY_A ):
		move_vec.x -= 1
	if Input.is_key_pressed( KEY_D ):
		move_vec.x += 1
		
	if 0 != move_vec.x or 0 != move_vec.y:
		get_viewport().get_camera_2d().position += ( move_vec * move_speed * delta )



############################   User   ############################
func add_camera():
	if null != get_viewport().get_camera_2d():
		return
		
	add_child( Camera2D.new() )
