class_name input_mouse_position extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Mouse Position"



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "Camera U", Key.KEY_W, func(): $Label.position.y -= 10 )
	pam.add_action( "Camera D", Key.KEY_S, func(): $Label.position.y += 10 )
	pam.add_action( "Camera L", Key.KEY_A, func(): $Label.position.x -= 10 )
	pam.add_action( "Camera R", Key.KEY_D, func(): $Label.position.x += 10 )
	pam.add_lf()
	pam.add_message( "> Viewport 위의 자표라서 Camera 이동에 영향 받지 않는다." )
	build_summary( eSceneType.TEST )


func _process( _delta ):
	$Label.text = "mouse : %s" % str( get_viewport().get_mouse_position() )
