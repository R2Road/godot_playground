extends GDPTScene



############################ Variable ############################
const move_speed : int = 200



############################ Override ############################
func _ready():
	pam.set_name( "ViewPort : Basic" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_message( "[ W | A | S | D ] Move Viewport" )
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
	#if null == get_viewport().get_camera_2d():
	#	return
	
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
		move_vec *=( move_speed * delta )
		get_viewport().global_canvas_transform.origin += move_vec


func _exit_tree():
	get_viewport().global_canvas_transform.origin = Vector2.ZERO
