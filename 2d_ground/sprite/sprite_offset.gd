extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Offset" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "Move Offset : U", Key.KEY_S, move_offset_up )
	pam.add_action( "Move Offset : D", Key.KEY_W, move_offset_down )
	pam.add_action( "Move Offset : R", Key.KEY_D, move_offset_right )
	pam.add_action( "Move Offset : L", Key.KEY_A, move_offset_left )
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
func move_offset_up():
	$Sprite2D.offset.y += 1
	update_info()
func move_offset_down():
	$Sprite2D.offset.y -= 1
	update_info()
func move_offset_right():
	$Sprite2D.offset.x += 1
	update_info()
func move_offset_left():
	$Sprite2D.offset.x -= 1
	update_info()

func update_info():
	$Sprite2D/Label.text = str( $Sprite2D.position ) + "\n" + str( $Sprite2D.offset )
