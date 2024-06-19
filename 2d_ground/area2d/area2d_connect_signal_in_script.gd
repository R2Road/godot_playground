extends PlaygroundScene



############################ Variable ############################
const move_speed : int = 200


############################ Override ############################
func _ready():
	pam.set_name( "Area2D : Connect Signal in Script" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_message( "[ W | A | S | D ] Move Player" )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	
	$Area2D_Player.area_entered.connect( _on_area_2d_player_area_entered )
	$Area2D_Player.area_exited.connect( _on_area_2d_player_area_exited )


func _physics_process( delta ):
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
		$Area2D_Player.position += ( move_vec * move_speed * delta )



############################  Signal  ############################
func _on_area_2d_player_area_entered(area):
	$Label.text = "O"


func _on_area_2d_player_area_exited(area):
	$Label.text = "X"
