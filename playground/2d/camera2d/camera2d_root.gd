extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Camera2D Root" )
	pam.add_split()
	pam.add_front( "2D Root",		Key.KEY_ESCAPE, "res://2d/2d_root.tscn" )
	pam.add_lf()
	pam.add_mover( "ViewPort",			Key.KEY_1, 		"res://2d/camera2d/viewport_basic.tscn" )
	pam.add_mover( "Default",			Key.KEY_2, 		"res://2d/camera2d/camera2d_default.tscn" )
	pam.add_mover( "Camera Switch",		Key.KEY_3, 		"res://2d/camera2d/camera2d_switch.tscn" )
	pam.add_mover( "UI",				Key.KEY_4, 		"res://2d/camera2d/ui_camera.tscn" )
	build_summary( eSceneType.ROOT )
