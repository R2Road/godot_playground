extends PlaygroundScene



############################ Variable ############################
@export var test_scene_resource_1 : PackedScene
@export var test_scene_resource_2 : PackedScene = load( "res://gds_basic/gds_basic_helper_sprite2d.tscn" )



############################ Override ############################
func _ready():
	pam.set_name( "Instantiate + PackedScene" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	var test_scene_1 = test_scene_resource_1.instantiate()
	test_scene_1.position = ( get_viewport().size * 0.35 )
	add_child( test_scene_1 )
	
	var test_scene_2 = test_scene_resource_2.instantiate()
	test_scene_2.position = ( get_viewport().size * 0.65 )
	add_child( test_scene_2 )
