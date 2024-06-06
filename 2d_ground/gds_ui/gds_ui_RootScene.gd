extends Node2D


func _ready():
	set_process_input( true ) # is not need : default on

	var title_string = \
			"+ UI" \
			+ "\n" \
			+ "[ESC] Return to Root" \
			+ "\n\n" \
			+ "[1] Label" \
			+ ""
		
	var summury_node = get_node( "Summury" )
	summury_node.text = title_string
	
	summury_node.set_position(
		Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.5 )
		- Vector2( summury_node.get_minimum_size().x * 0.5, summury_node.get_minimum_size().y * 0.5 )
	)
	
	
func _input(event):
	if !(event is InputEventKey ):
		return
	
	if !event.is_pressed():
		return
		
	match event.keycode:
		KEY_ESCAPE:
			get_tree().change_scene_to_file("res://playground_main.tscn")
		KEY_1:
			get_tree().change_scene_to_file("res://gds_ui/gds_ui_LabelScene.tscn")
