extends GDPTScene



############################ Variable ############################
const move_speed : int = 200



############################ Override ############################
func _ready():
	pam.set_name( "UI Camera" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_message( "[ W | A | S | D ] Move Camera" )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	$CanvasLayer/Label.position = (
		( get_viewport().size * 0.5 )
		- ( $CanvasLayer/Label.get_minimum_size() * $CanvasLayer/Label.get_scale() * 0.5 )
	)
	
	$helper_point.position = ( get_viewport().size * 0.5 )
	$helper_rect.rect.size.x = get_viewport().size.x
	$helper_rect.rect.size.y = get_viewport().size.y
	
	get_viewport().get_camera_2d().position = ( get_viewport().size * 0.5 )


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
