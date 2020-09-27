extends Node
	
func _ready():
	set_process_input( true ) # is not need : default on

	var title_string = \
		"+ Log" \
		+ "\n" \
		+ "[ESC] Return to Root" \
		+ ""
		
	var summury_node = get_node( "Summury" )
	summury_node.text = title_string
	
	DoLogTest()
	
func _input(event):
	if !(event is InputEventKey ):
		return
	
	if !event.is_pressed():
		return
		
	match event.scancode:
		KEY_ESCAPE:
			get_tree().change_scene("res://gds_basic/gds_basic_RootScene.tscn")
	
func DoLogTest():
	push_error( "push_error" )
	push_warning( "push_warning" )
	print_debug( "print_debug" )
	printerr( "printerr" )
	prints( "prints : ", "A", "B", "C", "D" )
	printt( "printt : ", "A", "B", "C", "D" )
	printraw( "prinraw 1 " )
	printraw( "prinraw 2 " )
	printt( "\n" )
