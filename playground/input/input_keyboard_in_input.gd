extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Input Keyboard : In Input" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_message( "[Any Key] Press" )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	UpdatePressdMessage( "Press Keyboard" )
	UpdateReleasedMessage( "Press Keyboard" )


func _input(event):
	if !( event is InputEventKey ):
		return
	
	if event.is_pressed():
		ProcessKeyPressed( event )
		return
	
	if event.is_released():
		ProcessKeyReleased( event )
		return


############################   User   ############################
func ProcessKeyPressed( _key_event : InputEventKey ):
	UpdatePressdMessage( "key pressed : " + _key_event.as_text() )

func UpdatePressdMessage( _message : String ):
	var message_node = get_node( "PressedMessage" )
	message_node.text = _message
	message_node.set_position(
			( get_viewport().size * 0.3 )
			- ( message_node.get_minimum_size() * message_node.get_scale() * 0.5 )
	)

func ProcessKeyReleased( _key_event : InputEventKey ):
	UpdateReleasedMessage( "key released : " + _key_event.as_text() )

func UpdateReleasedMessage( _message : String ):
	var message_node = get_node( "ReleasedMessage" )
	message_node.text = _message
	message_node.set_position(
			( get_viewport().size * 0.6 )
			- ( message_node.get_minimum_size() * message_node.get_scale() * 0.5 )
	)
