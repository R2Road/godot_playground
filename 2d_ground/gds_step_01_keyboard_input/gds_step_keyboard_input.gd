extends Node

<<<<<<< HEAD
func _ready():
	set_process_input( true )

func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.scancode == KEY_A:
			print( "target key pressed : ", event.as_text() )
		else:
			print( "other key pressed : ", event.as_text() )
=======
func _input(event):
	if event is InputEventKey and event.is_pressed():
		print( event.as_text() )
>>>>>>> 0dda8f19f34a98a9579f6d13c236f806468c8f64
