extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Camera2D Root" )
	pam.add_split()
	pam.add_mover( "Playground",		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Camera Swap",		Key.KEY_1, 		"res://etc/etc_camera2d_swap.tscn" )
	build_summary( eSceneType.ROOT )
