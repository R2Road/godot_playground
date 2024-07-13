extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Animation : Basic" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
