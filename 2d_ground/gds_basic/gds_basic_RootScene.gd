extends Node2D


var title_string = \
		"+ gds basic Root" \
		+ "\n" \
		+ "[ESC] Return to Root" \
		+ "\n\n" \
		+ "[1] Empty" \
		+ "\n" \
		+ "[2] OS" \
		+ "\n" \
		+ "[3] Tree Order" \
		+ "\n" \
		+ "[4] Log" \
		+ "\n" \
		+ "[5] Keyboard Input" \
		+ "\n" \
		+ "[6] Get Node" \
		+ "\n" \
		+ "[7] Node Path3D" \
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
		
	match event.keycode:
		KEY_ESCAPE:
			get_tree().change_scene_to_file("res://PlayGround.tscn")
		KEY_1:
			get_tree().change_scene_to_file("res://gds_basic/gds_basic_EmptyScene.tscn")
		KEY_2:
			get_tree().change_scene_to_file("res://gds_basic/gds_basic_OSScene.tscn")
		KEY_3:
			get_tree().change_scene_to_file("res://gds_basic/gds_basic_TreeOrderScene.tscn")
		KEY_4:
			get_tree().change_scene_to_file("res://gds_basic/gds_basic_LogScene.tscn")
		KEY_5:
			get_tree().change_scene_to_file("res://gds_basic/gds_basic_KeyboardInputScene.tscn")
		KEY_6:
			get_tree().change_scene_to_file("res://gds_basic/gds_basic_GetNodeScene.tscn")
		KEY_7:
			get_tree().change_scene_to_file("res://gds_basic/gds_basic_NodePathScene.tscn")
