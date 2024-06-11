extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Basic" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
