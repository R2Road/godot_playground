extends GDPTScene



### Variable #####################################################
var last_pressed_key : Key = Key.KEY_NONE
var last_pressed_count : int = 0
var last_released_key : Key = Key.KEY_NONE
var last_released_count : int = 0



############################ Override ############################
func _ready():
	pam.set_name( "Input Keyboard : In Input" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_message( "[Any Key] Press" )
	pam.add_lf()
	pam.add_note( "Key 상태를 3단계가 아닌 2단계로 구분해놔서 유저가 직접 처리할 부분이 생겼다." )
	pam.add_note( "이럴 이유가 있는가?" )
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
	if _key_event.keycode == last_pressed_key:
		last_pressed_count += 1
	else:
		last_pressed_key = _key_event.keycode
		last_pressed_count = 1
	
	UpdatePressdMessage( "key pressed : " + _key_event.as_text() + "     repeat : " + str( last_pressed_count ) )

func UpdatePressdMessage( _message : String ):
	var message_node = get_node( "PressedMessage" )
	message_node.text = _message
	message_node.set_position(
			( get_viewport().size * 0.3 )
			- ( message_node.get_minimum_size() * message_node.get_scale() * 0.5 )
	)


func ProcessKeyReleased( _key_event : InputEventKey ):
	if _key_event.keycode == last_released_key:
		last_released_count += 1
	else:
		last_released_key = _key_event.keycode
		last_released_count = 1
	
	UpdateReleasedMessage( "key released : " + _key_event.as_text() + "     repeat : " + str( last_released_count ) )

func UpdateReleasedMessage( _message : String ):
	var message_node = get_node( "ReleasedMessage" )
	message_node.text = _message
	message_node.set_position(
			( get_viewport().size * 0.6 )
			- ( message_node.get_minimum_size() * message_node.get_scale() * 0.5 )
	)
