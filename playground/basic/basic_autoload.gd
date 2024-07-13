extends GDPTScene



############################ Override ############################
func _ready():	
	pam.set_name( "AutoLoad" )
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	GDPT.on_assert
