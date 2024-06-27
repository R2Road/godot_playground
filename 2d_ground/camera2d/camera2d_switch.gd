extends PlaygroundScene



############################ Variable ############################
@onready var camera_1 = $helper_point_1/Camera2D
@onready var camera_3 = $helper_point_3/Camera2D



############################ Override ############################
func _ready():
	pam.set_name( "Camera : Switch" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "Switch Camera ( 1 <> 3 )", Key.KEY_1, swap_camera )
	build_summary( eSceneType.TEST )



############################   User   ############################
func swap_camera():
	if camera_1.enabled :
		camera_1.enabled = false
		camera_3.enabled = true
	elif camera_3.enabled :
		camera_1.enabled = true
		camera_3.enabled = false
