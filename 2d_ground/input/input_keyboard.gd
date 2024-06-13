extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Keyboard Input" )
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )


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
			Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.5 )
			- ( Vector2( message_node.get_minimum_size().x * 0.5, message_node.get_minimum_size().y * 0.5 ) * $Message.get_scale() )
	)
