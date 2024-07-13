extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Tilemap : Physics 1" )
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
