extends GDPTScene



############################ Override ############################
func _init():
	super._init()
	print( "init : " + name )


func _ready():
	pam.set_name( "Tree Order" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	print( "ready : " + name )


func _enter_tree():
	print( "enter tree : " + name )


var test = true
func _process( _delta ):
	if test:
		print( "process : " + name )
		test = false
