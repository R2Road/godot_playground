extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Input Map in Project Setting" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_message( "[ W | A | S | D | SPACE ] Press" )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	update_message( "Press Keyboard" )


func _process( _delta ):
	var text : String = ""
	if Input.is_action_pressed( "test_w" ):
		text += "w" + " "
	if Input.is_action_pressed( "test_a" ):
		text += "a" + " "
	if Input.is_action_pressed( "test_s" ):
		text += "s" + " "
	if Input.is_action_pressed( "test_d" ):
		text += "d" + " "
	if Input.is_action_pressed( "test_space" ):
		text += "space" + " "
	
	if not text.is_empty():
		update_message( text )


############################   User   ############################
func update_message( text ):
	var message_node = get_node( "Message" )
	message_node.text = text
	message_node.set_position(
			Vector2( get_viewport().size.x * 0.17, get_viewport().size.y * 0.5 )
			- ( message_node.get_minimum_size() * message_node.get_scale() * 0.5 )
	)
