extends GDPTScene



############################ Variable ############################
var test_node_resource = preload( "res://2d/helper/helper_sprite2d_01.tscn" )



############################ Override ############################
func _ready():
	pam.set_name( "Instantiate + Preload" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_message( "> Show Script" )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	var test_node = test_node_resource.instantiate()
	test_node.position = ( get_viewport().size * 0.5 )
	add_child( test_node )
