extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Camera2D Root" )
	pam.add_split()
	pam.add_mover( "Playground",		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "ViewPort",			Key.KEY_1, 		"res://camera2d/viewport_basic.tscn" )
	pam.add_mover( "Default",			Key.KEY_2, 		"res://camera2d/camera2d_default.tscn" )
	pam.add_mover( "Camera Switch",		Key.KEY_3, 		"res://camera2d/camera2d_switch.tscn" )
	build_summary( eSceneType.ROOT )
