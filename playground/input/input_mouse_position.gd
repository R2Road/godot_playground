class_name input_mouse_position extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Mouse Position"



############################ Override ############################
func _ready():
	pam.set_name( input_mouse_position.scene_name() )
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_message( "> DisplayServer.mouse_get_position() : Windows의 마우스 좌표." )
	pam.add_message( "> get_viewport().get_mouse_position() : Viewport 위의 좌표는 Camera 이동에 영향 받지 않는다." )
	pam.add_message( "> CanvasItem.get_global_mouse_position() : CanvasItem이 제공하는 mouse의 월드 좌표." )
	pam.add_lf()
	pam.add_action( "Camera U", Key.KEY_W, func(): $helper_0_0.position.y -= 10 )
	pam.add_action( "Camera D", Key.KEY_S, func(): $helper_0_0.position.y += 10 )
	pam.add_action( "Camera L", Key.KEY_A, func(): $helper_0_0.position.x -= 10 )
	pam.add_action( "Camera R", Key.KEY_D, func(): $helper_0_0.position.x += 10 )
	build_summary( eSceneType.TEST )


func _process( _delta ):
	$Label.text = (
		"mouse on display server : %s\n\nmouse on viewport : %s\n\n mouse on global : %s"
		% [
			str( DisplayServer.mouse_get_position() )
			, str( get_viewport().get_mouse_position() )
			, str( get_global_mouse_position() )
		]
	)
