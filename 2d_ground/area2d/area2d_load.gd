extends PlaygroundScene



############################ Variable ############################
const move_speed : int = 200


############################ Override ############################
func _ready():
	pam.set_name( "Area2d : Load" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_message( "[ W | A | S | D ] Move Player" )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	
	# Area2D_Area_Load_Shape_In_Script
	$Area2D_Area_Load_Shape_In_Script/CollisionShape2D.shape = RectangleShape2D.new()
	$Area2D_Area_Load_Shape_In_Script/CollisionShape2D.shape.size = Vector2( 134, 216 )
	
	
	# Area2D_Load_In_Script
	var area2d_load_in_script = Area2D.new()
	area2d_load_in_script.name = "Area2D_Load_In_Script"
	add_child( area2d_load_in_script )
	$Area2D_Load_In_Script.set_position( $Area2D_Area_Load_Shape_In_Script.position + Vector2( 350, 0 ) )
	
	var cs2d = CollisionShape2D.new()
	cs2d.name = "CollisionShape2D"
	$Area2D_Load_In_Script.add_child( cs2d )
	$Area2D_Load_In_Script/CollisionShape2D.shape = RectangleShape2D.new()
	$Area2D_Load_In_Script/CollisionShape2D.shape.size = Vector2( 134, 216 )
	
	var sprite = Sprite2D.new()
	sprite.name = "Sprite2D"
	$Area2D_Load_In_Script.add_child( sprite )
	$Area2D_Load_In_Script/Sprite2D.texture = ResourceLoader.load( "res://resources/sprite/actor001/actor001_idle_01.png" )
	$Area2D_Load_In_Script/Sprite2D.set_texture_filter( CanvasItem.TEXTURE_FILTER_NEAREST )
	$Area2D_Load_In_Script/Sprite2D.scale = Vector2( 4, 4 )
	
	var label = Label.new()
	label.name = "Label"
	$Area2D_Load_In_Script.add_child( label )
	$Area2D_Load_In_Script/Label.text = "Sensor\nLoad In Script"
	$Area2D_Load_In_Script/Label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	$Area2D_Load_In_Script/Label.set_position( Vector2( -52, 76 ) )


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


func _on_area_2d_player_area_entered(area):
	$Label.text = "O"


func _on_area_2d_player_area_exited(area):
	$Label.text = "X"
