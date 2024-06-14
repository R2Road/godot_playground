extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Input Map : Update Action Event" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_message( "[ W | A | S | D | Z ] Press" )
	pam.add_message( "     > Key Changed : Space > Z" )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#	
	update_action()
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
			( get_viewport().size * 0.5 )
			- ( message_node.get_minimum_size() * message_node.get_scale() * 0.5 )
	)


func update_action():
	print( "[test_space] event count : " + str( InputMap.action_get_events( "test_space" ).size() ) )
	
	InputMap.action_erase_events( "test_space" )
	
	print( "[test_space] event count : " + str( InputMap.action_get_events( "test_space" ).size() ) )
	
	var new_input_event_key = InputEventKey.new()
	new_input_event_key.keycode = KEY_Z
	InputMap.action_add_event( "test_space", new_input_event_key )
	
	print( "[test_space] event count : " + str( InputMap.action_get_events( "test_space" ).size() ) )
