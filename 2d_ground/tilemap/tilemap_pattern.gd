extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Tilemap : Pattern" )
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
