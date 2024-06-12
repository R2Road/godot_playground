extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Empty" )
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
