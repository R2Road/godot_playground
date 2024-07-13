extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Log" )
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	DoLogTest()



############################   User   ############################
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
