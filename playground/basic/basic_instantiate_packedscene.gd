extends GDPTScene



############################ Variable ############################
@export var test_scene_resource_1 : PackedScene
@export var test_scene_resource_2 : PackedScene = preload( "res://2d/helper/helper_sprite2d_02.tscn" )



############################ Override ############################
func _ready():
	pam.set_name( "Instantiate + PackedScene" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_message( "> Show Script" )
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
