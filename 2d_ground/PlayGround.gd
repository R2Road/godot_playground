extends Node2D


func _ready():
	set_process_input( true ) # is not need : default on
	
	var title_string = \
			"+ Play Ground" \
			+ "\n" \
			+ "[ESC] Exit" \
			+ "\n\n" \
			+ "[1] Basic" \
			+ "\n" \
			+ "[2] UI" \
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
		
	match event.scancode:
		KEY_ESCAPE:
			set_process_input( false )
			get_tree().quit()
		KEY_1:
			get_tree().change_scene("res://gds_basic/gds_basic_RootScene.tscn")
		KEY_2:
			get_tree().change_scene("res://gds_ui/gds_ui_RootScene.tscn")

