extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "RigidBody2D Root" )
	pam.add_split()
	pam.add_mover( "Playground",		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Move : 4-Way",		Key.KEY_1, "res://rigidbody2d/rigidbody2d_move_4way.tscn" )
	pam.add_mover( "Move : Thrust ",	Key.KEY_2, "res://rigidbody2d/rigidbody2d_move_thrust.tscn" )
	pam.add_mover( "Basic",				Key.KEY_3, "res://rigidbody2d/rigidbody2d_basic.tscn" )
	build_summary( eSceneType.ROOT )
