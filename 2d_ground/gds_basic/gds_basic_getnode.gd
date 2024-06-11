extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Get Node" )
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	DoPractice()



############################   User   ############################
func DoPractice():
	get_node( "1" ).set_position( Vector2( 150, 150 ) )
	get_node( "1/1_1" ).set_position( Vector2( 50, 50 ) )
	
	get_node( "2" ).set_position( Vector2( 350, 150 ) )
	get_node( "2/2_1" ).set_position( Vector2( 50, 50 ) )
	get_node( "2/2_1/2_1_1" ).set_position( Vector2( 50, 50 ) )
