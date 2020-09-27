extends Node

func _ready():
	set_process_input( true )

func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.scancode == KEY_A:
			print( "target key pressed : ", event.as_text() )
		else:
			print( "other key pressed : ", event.as_text() )
