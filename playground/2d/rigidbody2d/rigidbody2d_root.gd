extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "RigidBody2D Root" )
	pam.add_split()
	pam.add_mover( "2D Root",		Key.KEY_ESCAPE, "res://2d/2d_root.tscn" )
	pam.add_lf()
	pam.add_mover( "Move : 4-Way",		Key.KEY_1, "res://2d/rigidbody2d/rigidbody2d_move_4way.tscn" )
	pam.add_mover( "Move : Thrust ",	Key.KEY_2, "res://2d/rigidbody2d/rigidbody2d_move_thrust.tscn" )
	pam.add_mover( "Demo",				Key.KEY_3, "res://2d/rigidbody2d/rigidbody2d_demo.tscn" )
	build_summary( eSceneType.ROOT )
