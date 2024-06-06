extends Node2D



############################ Variable ############################
var next_scenes = [
	  NextSceneInfo.new( "Exit",  Key.KEY_ESCAPE, "res://playground_exit.tscn" )
	, NextSceneInfo.new( "Basic",  Key.KEY_1, "res://gds_basic/gds_basic_RootScene.tscn" )
	, NextSceneInfo.new( "UI", Key.KEY_2, "res://gds_ui/gds_ui_RootScene.tscn" )
]



############################ Override ############################
func _ready():
	set_process_input( true ) # is not need : default on
	
	var title_string = "" \
			+ "+ Play Ground" \
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
	
	for i in next_scenes:
		if i.key == event.keycode:
			get_tree().change_scene_to_file( i.scene_path )
