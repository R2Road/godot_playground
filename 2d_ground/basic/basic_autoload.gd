extends PlaygroundScene



############################ Override ############################
func _ready():	
	pam.set_name( "AutoLoad" )
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	PGG.on_assert
