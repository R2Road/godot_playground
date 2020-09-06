extends Node

func _input(event):
	if event is InputEventKey and event.is_pressed():
		print( event.as_text() )
