extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Sound : Stream Basic" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
