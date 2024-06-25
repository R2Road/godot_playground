extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Sprite2D : Aliasing" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	$Sprite2D_Default.set_position( get_viewport().size * 0.25 )
	$Sprite2D_Aliasing_In_Editor.set_position( get_viewport().size * 0.5 )
	$Sprite2D_Aliasing_In_Script.set_position( get_viewport().size * 0.75 )
	
	# Set Texture Filter
	$Sprite2D_Aliasing_In_Script.set_texture_filter( CanvasItem.TEXTURE_FILTER_NEAREST )
