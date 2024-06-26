extends PlaygroundScene



############################ Variable ############################
@onready var camera_1 = $helper_point_1/Camera2D
@onready var camera_2 = $helper_point_2/Camera2D



############################ Override ############################
func _ready():
	pam.set_name( "Camera : Swap" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "Swap Camera", Key.KEY_1, swap_camera )
	build_summary( eSceneType.TEST )



############################   User   ############################
func swap_camera():
	if camera_1.enabled :
		camera_1.enabled = false
		camera_2.enabled = true
	else:
		camera_1.enabled = true
		camera_2.enabled = false
