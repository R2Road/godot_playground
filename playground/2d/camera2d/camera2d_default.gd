extends GDPTScene



############################ Variable ############################
const move_speed : int = 200



############################ Override ############################
func _ready():
	pam.set_name( "ViewPort" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "Camera On", 	Key.KEY_1, camera_on )
	pam.add_action( "Camera Off", 	Key.KEY_2, camera_off )
	pam.add_message( "[ W | A | S | D ] Move Camera( Add Camera First )" )
	build_summary( eSceneType.TEST )


func _physics_process( delta ):
	if null == get_viewport().get_camera_2d():
		return
	
	var move_vec : Vector2 = Vector2.ZERO
	
	if Input.is_key_pressed( KEY_W ):
		move_vec.y -= 1
	if Input.is_key_pressed( KEY_S ):
		move_vec.y += 1
	if Input.is_key_pressed( KEY_A ):
		move_vec.x -= 1
	if Input.is_key_pressed( KEY_D ):
		move_vec.x += 1
		
	if 0 != move_vec.x or 0 != move_vec.y:
		get_viewport().get_camera_2d().position += ( move_vec * move_speed * delta )



############################   User   ############################
func camera_on():
	var camera2d = get_node_or_null( "Cam" )
	if null == camera2d:
		camera2d = Camera2D.new()
		camera2d.name = "Cam"
		add_child( camera2d )	
	
	if null == get_viewport().get_camera_2d():	
		get_node_or_null( "Cam" ).enabled = true


func camera_off():
	if null != get_viewport().get_camera_2d():
		get_viewport().get_camera_2d().enabled = false
