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
		
	match event.keycode:
		KEY_ESCAPE:
			get_tree().change_scene_to_file( "res://gds_ui/gds_ui_root.tscn" )
		KEY_A:
			change_font_color_blue()
		KEY_S:
			change_font_color_green()
		KEY_D:
			append_text()



func change_font_color_blue():
	get_node( "Summury" ).add_theme_color_override( "font_color", Color( 0, 0, 1 ) )


func change_font_color_green():
	get_node( "Summury" ).set( "theme_override_colors/font_color", Color( 0, 1, 0 ) )


func append_text():
	get_node( "Summury" ).text += "\nTest String"
