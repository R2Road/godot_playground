extends Node2D


func _ready():
	set_process_input( true ) # is not need : default on

	var title_string = \
			"+ UI" \
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
			get_tree().change_scene("res://PlayGround.tscn")
