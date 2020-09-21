extends Node2D


var title_string = \
	"Play Ground" \
	+ "\n" \
	+ "[ESC] Exit"


func _ready():
	var summury_node = get_node( "Summury" )
	summury_node.text = title_string
	
	summury_node.set_position(
		summury_node.get_position()
		- Vector2( summury_node.rect_size.x * 0.5, summury_node.rect_size.y * 0.5 )
	)
	
	set_process_input( true ) # is not need : default on
	
	
func _input(event):
	if event is InputEventKey and event.is_pressed():
		if event.scancode == KEY_ESCAPE:
			set_process_input( false )
			get_tree().quit()
