extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Tilemap : Demo 1" )
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
