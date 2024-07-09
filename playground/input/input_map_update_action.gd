extends PlaygroundScene



############################ Variable ############################
var my_input_action_infos : Array



############################ Override ############################
func _ready():
	pam.set_name( "Input Map : Update Action" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_message( "     > Action Changed : test_space > test_q" )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#	
	change_key()
	
	collect_my_input_action_infos()
	show_my_input_action_infos()
	
	update_message( "Press Keyboard" )


func _process( _delta ):
	var text : String = ""
	
	for a in my_input_action_infos:
		if Input.is_action_pressed( a[0] ):
			text += OS.get_keycode_string( a[1] ) + " "	
	
	if not text.is_empty():
		update_message( text )


func _exit_tree():
	rollback_key()	



############################   User   ############################
func update_message( text ):
	var message_node = get_node( "Message" )
	message_node.text = text
	message_node.set_position(
			Vector2( get_viewport().size.x * 0.3, get_viewport().size.y * 0.5 )
			- ( message_node.get_minimum_size() * message_node.get_scale() * 0.5 )
	)


func change_key():
	InputMap.erase_action( "test_space" )
	
	InputMap.add_action( "test_q" )
	var new_input_event_key = InputEventKey.new()
	new_input_event_key.physical_keycode = KEY_Q
	InputMap.action_add_event( "test_q", new_input_event_key )


func rollback_key():
	InputMap.erase_action( "test_q" )
	
	InputMap.add_action( "test_space" )	
	var new_input_event_key = InputEventKey.new()
	new_input_event_key.physical_keycode = KEY_SPACE
	InputMap.action_add_event( "test_space", new_input_event_key )


func collect_my_input_action_infos():
	for a in InputMap.get_actions():
		if not a.contains( "test" ):
			continue
			
		my_input_action_infos.push_back( [
			a
			, InputMap.action_get_events( a )[0].physical_keycode
		] )


func show_my_input_action_infos():
	var s : String = ""
	for a in my_input_action_infos:
		s += a[0] + " : "
		s += " " + OS.get_keycode_string( a[1] )
		s += "\n"
	
	var label = get_node( "Actions" )
	label.text = s
	label.set_position(
		Vector2( get_viewport().size.x * 0.7, get_viewport().size.y * 0.5 )
		- ( label.get_minimum_size() * label.get_scale() * 0.5 )
	)
