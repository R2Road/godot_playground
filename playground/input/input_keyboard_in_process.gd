extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Input Keyboard : In Process" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_message( "[A|S|D|F] Press" )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	UpdateMessage( "-" )


func _process( _delta ):
	if Input.is_key_pressed( KEY_A ):
		UpdateMessage( "A" )
	if Input.is_key_pressed( KEY_S ):
		UpdateMessage( "S" )
	if Input.is_key_pressed( KEY_D ):
		UpdateMessage( "D" )
	if Input.is_key_pressed( KEY_F ):
		UpdateMessage( "F" )


############################   User   ############################
func UpdateMessage( key_name : String ):
	var message_node = get_node( "Message" )
	message_node.text = "key pressed : " + key_name
	message_node.set_position(
			( get_viewport().size * 0.5 )
			- ( message_node.get_minimum_size() * message_node.get_scale() * 0.5 )
	)
