extends Node2D


func _ready():
	set_process_input( true ) # is not need : default on

	var title_string = \
			"+ Empty" \
			+ "\n" \
			+ "[ESC] Return to Root" \
			+ "\n\n" \
			+ "[A] Change Color : Blue" \
			+ "\n" \
			+ "[S] Change Color : Green" \
			+ "\n" \
			+ "[D] Append Text" \
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
			get_tree().change_scene( "res://gds_ui/gds_ui_RootScene.tscn" )
		KEY_A:
			get_node( "Summury" ).add_color_override( "font_color", Color( 0, 0, 1 ) )
		KEY_S:
			get_node( "Summury" ).set( "custom_colors/font_color", Color( 0, 1, 0 ) )
		KEY_D:
			get_node( "Summury" ).text += "\nTest String"
			
