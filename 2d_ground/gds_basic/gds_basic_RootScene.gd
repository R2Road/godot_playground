extends Node2D


var title_string = \
	"+ gds basic Root" \
	+ "\n" \
	+ "[ESC] Exit" \
	+ "\n\n" \
	+ "[1] Empty" \
	+ "\n" \
	+ "[2] OS" \
	+ ""


func _ready():
	var summury_node = get_node( "Summury" )
	summury_node.text = title_string
	
	summury_node.set_position(
		Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.5 )
		- Vector2( summury_node.get_minimum_size().x * 0.5, summury_node.get_minimum_size().y * 0.5 )
	)
	
	set_process_input( true ) # is not need : default on
	
	
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
			get_tree().change_scene("res://gds_basic/gds_basic_EmptyScene.tscn")
		KEY_2:
			get_tree().change_scene("res://gds_basic/gds_basic_OSScene.tscn")
