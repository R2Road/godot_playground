extends GDPTScene



############################ Variable ############################
@export var move_speed : int = 500



############################ Override ############################
func _ready():
	pam.set_name( "RigidBody2D : Move : 4-Way" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_message( "[ W | A | S | D ] Move" )
	build_summary( eSceneType.TEST )


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
