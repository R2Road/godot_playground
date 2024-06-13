extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Input Keyboard : In Input" )
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	UpdateMessage( "Press Keyboard" )


func _input(event):
	# for PlaygroundScene
	super._input( event )
	
	
	if !(event is InputEventKey ):
		return
	
	if !event.is_pressed():
		return
		
	match event.keycode:
		_:
			UpdateMessage( "key pressed : " + event.as_text() )


############################   User   ############################
func UpdateMessage( arg ):
	var message_node = get_node( "Message" )
	message_node.text = str( arg )
	message_node.set_position(
			( get_viewport().size * 0.5 )
			- ( message_node.get_minimum_size() * message_node.get_scale() * 0.5 )
	)
