extends Node

func _ready():
	set_process_input( true ) # is not need : default on

	var title_string = \
		"+ Keyboard Input" \
		+ "\n" \
		+ "[ESC] Return to Root" \
		+ ""
		
	var summury_node = get_node( "Summury" )
	summury_node.text = title_string

func _input(event):
	if !(event is InputEventKey ):
		return
	
	if !event.is_pressed():
		return
		
	match event.scancode:
		KEY_ESCAPE:
			get_tree().change_scene("res://gds_basic/gds_basic_RootScene.tscn")
		_:
			UpdateMessage( "key pressed : " + event.as_text() )
			
func UpdateMessage( arg ):
	$Message.text = str( arg )
	$Message.set_position(
			Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.5 )
			- ( Vector2( $Message.get_minimum_size().x * 0.5, $Message.get_minimum_size().y * 0.5 ) * $Message.get_scale() )
	)
