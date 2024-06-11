extends PlaygroundScene



############################ Override ############################
func _init():
	super._init()
	print( name + " init" )


func _ready():
	pam.set_name( "Tree Order" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	print( name + " ready" )


func _enter_tree():
	print( name + " enter tree" )


var test = true
func _process( _delta ):
	if test:
		print( name + " process" )
		test = false
