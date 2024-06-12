extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Pivot" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	$Sprite2D.set_position( get_viewport().size * 0.5 )
	
	# sprite2d position pivot
	var pivot_scene = ResourceLoader.load( "res://helper/helper_point.tscn" ).instantiate()
	pivot_scene.position = $Sprite2D.position
	add_child( pivot_scene )
