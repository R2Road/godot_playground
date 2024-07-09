extends PlaygroundScene



############################ Variable ############################
@export var move_speed : int = 300
@export var spin_speed : int = 1000

var thrust = false
var spin = 0


############################ Override ############################
func _ready():
	pam.set_name( "RigidBody2D : Move : Thrust" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_message( "[ W ] Thrust" )
	pam.add_message( "[ S | D ] Rotation" )
	build_summary( eSceneType.TEST )


func _unhandled_key_input( event ):
	if KEY_W == event.keycode:
		if event.is_pressed():
			thrust = true
		else:
			thrust = false
	
	if KEY_A == event.keycode:
		if event.is_pressed():
			spin = -1
		else:
			spin = 0
	
	if KEY_D == event.keycode:
		if event.is_pressed():
			spin = 1
		else:
			spin = 0

func _physics_process( delta ):
	# Move Front
	$Player.constant_force = ( ( $Player.transform.x * move_speed ) if thrust else Vector2.ZERO )
	
	# Spin
	$Player.constant_torque = spin * spin_speed
