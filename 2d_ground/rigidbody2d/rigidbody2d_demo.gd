extends PlaygroundScene



############################ Variable ############################
@export var move_speed : int = 300
var contact_count = 0


############################ Override ############################
func _ready():
	pam.set_name( "RigidBody2D : Demo" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_message( "[ W | A | S | D ] Move Player" )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	$Label.set_position(
		( get_viewport().size * 0.5 )
		- ( $Label.get_minimum_size() * $Label.get_scale() * 0.5 )
	)


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
		$Player.linear_velocity += ( move_vec * move_speed * delta )



############################  Signal  ############################
func _on_player_body_entered( body ):
	contact_count += 1
	$Label.text = str( contact_count )
	$Label.set_position(
		( get_viewport().size * 0.5 )
		- ( $Label.get_minimum_size() * $Label.get_scale() * 0.5 )
	)
