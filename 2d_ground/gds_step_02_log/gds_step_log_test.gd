extends Node
	
# Called when the node enters the scene tree for the first time.
func _ready():
	push_error( "push_error" )
	push_warning( "push_warning" )
	print_debug( "print_debug" )
	printerr( "printerr" )
	prints( "prints : ", "A", "B", "C", "D" )
	printt( "printt : ", "A", "B", "C", "D" )
	printraw( "prinraw 1 " )
	printraw( "prinraw 2 " )
	printt( "\n" )
