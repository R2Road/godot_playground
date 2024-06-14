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
	show_my_action_list()
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


func _exit_tree():
	rollback_action()	



############################   User   ############################
func update_message( text ):
	var message_node = get_node( "Message" )
	message_node.text = text
	message_node.set_position(
			Vector2( get_viewport().size.x * 0.3, get_viewport().size.y * 0.5 )
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


func rollback_action():	
	InputMap.action_erase_events( "test_space" )	
	var new_input_event_key = InputEventKey.new()
	new_input_event_key.keycode = KEY_SPACE
	InputMap.action_add_event( "test_space", new_input_event_key )


func show_my_action_list():
	var s : String = ""
	for a in InputMap.get_actions():
		if not a.contains( "test" ):
			continue
			
		s += a + " : "
		for e in InputMap.action_get_events( a ):
			if 0 != e.keycode:
				s += " " + OS.get_keycode_string( e.keycode )
			else:
				s += " " + OS.get_keycode_string( e.physical_keycode )
		s += "\n"
	
	var label = get_node( "Actions" )
	label.text = s
	label.set_position(
		Vector2( get_viewport().size.x * 0.7, get_viewport().size.y * 0.5 )
		- ( label.get_minimum_size() * label.get_scale() * 0.5 )
	)
