extends Node2D


func _ready():
	set_process_input( true ) # is not need : default on

	var title_string = \
			"+ Get Node" \
			+ "\n" \
			+ "[ESC] Return to Root" \
			+ ""
		
	var summury_node = get_node( "Summury" )
	summury_node.text = title_string
	
	DoPractice()
	
	
func _input(event):
	if !(event is InputEventKey ):
		return
	
	if !event.is_pressed():
		return
		
	match event.keycode:
		KEY_ESCAPE:
			get_tree().change_scene_to_file("res://gds_basic/gds_basic_RootScene.tscn")


func DoPractice():
	$A.set_position( Vector2( 150, 150 ) )
	$"A/A_1".set_position( Vector2( 50, 50 ) )
	
	$B.set_position( Vector2( 350, 150 ) )
	$B/B_1.set_position( Vector2( 50, 50 ) )
	$"B/B_1/B_1_1".set_position( Vector2( 50, 50 ) )