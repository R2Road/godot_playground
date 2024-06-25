extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Offset" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "Change Offset : U", Key.KEY_S, change_offset_up )
	pam.add_action( "Change Offset : D", Key.KEY_W, change_offset_down )
	pam.add_action( "Change Offset : R", Key.KEY_D, change_offset_right )
	pam.add_action( "Change Offset : L", Key.KEY_A, change_offset_left )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	$Sprite2D.set_position( get_viewport().size * 0.5 )
	
	# sprite2d position pivot
	var pivot_scene = ResourceLoader.load( "res://helper/helper_point.tscn" ).instantiate()
	pivot_scene.position = $Sprite2D.position
	add_child( pivot_scene )
	
	# Ready
	update_info()



############################   User   ############################
func change_offset_up():
	$Sprite2D.offset.y += 1
	update_info()
func change_offset_down():
	$Sprite2D.offset.y -= 1
	update_info()
func change_offset_right():
	$Sprite2D.offset.x += 1
	update_info()
func change_offset_left():
	$Sprite2D.offset.x -= 1
	update_info()

func update_info():
	$Label.text = (
			"position : " + str( $Sprite2D.position )
		+ 	"\n"
		+ 	"offset : " + str( $Sprite2D.offset ) )
	
	$Label.set_position(
		Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.7 )
		- ( $Label.get_minimum_size() * $Label.get_scale() * 0.5 )
	)
