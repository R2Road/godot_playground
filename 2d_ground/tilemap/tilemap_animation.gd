extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Tilemap : Animation" )
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
