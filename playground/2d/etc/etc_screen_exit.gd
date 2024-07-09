extends PlaygroundScene



############################ Variable ############################
const move_speed : int = 200



############################ Override ############################
func _ready():
	pam.set_name( "Screen Exit" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	init_position()



func _physics_process( delta ):
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
		$helper_rect.position += ( move_vec * move_speed * delta )



############################   User   ############################
func init_position():
	$helper_rect.set_position( ( get_viewport().size * 0.5 ) )



############################  Signal  ############################
func _on_visible_on_screen_notifier_2d_screen_exited():
	init_position()
