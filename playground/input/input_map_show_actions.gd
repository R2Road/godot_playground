extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Input Map : Actions" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#	
	show_my_action_list()



############################   User   ############################
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
	
	var message_node = get_node( "Message" )
	message_node.text = s
	message_node.set_position(
			( get_viewport().size * 0.5 )
			- ( message_node.get_minimum_size() * message_node.get_scale() * 0.5 )
	)
