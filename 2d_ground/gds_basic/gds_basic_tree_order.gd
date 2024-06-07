extends GDSBasic_TreeOrder_Helper



############################ Override ############################
func _ready():
	set_process_input( true ) # is not need : default on

	var title_string = \
			"+ Tree Order" \
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
		
	match event.keycode:
		KEY_ESCAPE:
			get_tree().change_scene_to_file("res://gds_basic/gds_basic_root.tscn")
