extends Node2D


func _ready():
	set_process_input( true ) # is not need : default on

	var title_string = \
			"+ OS" \
			+ "\n" \
			+ "[ESC] Return to Root" \
			+ "\n\n" \
			+ "[1] Shell Open" \
			+ "\n" \
			+ "[2] Get Dates" \
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
		KEY_1:
			UpdateMessage( OS.shell_open("https://godotengine.org/") )
		KEY_2:
			UpdateMessage( OS.get_datetime() )


func UpdateMessage( arg ):
	var message_node = get_node( "Message" )
	message_node.text = str( arg )
	message_node.set_position(
			Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.5 )
			- ( Vector2( message_node.get_minimum_size().x * 0.5, message_node.get_minimum_size().y * 0.5 ) * $Message.get_scale() )
	)
