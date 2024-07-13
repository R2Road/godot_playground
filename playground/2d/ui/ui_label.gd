extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Label" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "Change Color : Blue", 	Key.KEY_A, change_font_color_blue )
	pam.add_action( "Change Color : Green",	Key.KEY_S, change_font_color_green )
	pam.add_action( "Append Text", 			Key.KEY_D, append_text )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	$Label.set_position(
		( get_viewport().size * 0.5 )
		- ( $Label.get_minimum_size() * $Label.get_scale() * 0.5 )
	)


func change_font_color_blue():
	$Label.add_theme_color_override( "font_color", Color( 0, 0, 1 ) )


func change_font_color_green():
	$Label.set( "theme_override_colors/font_color", Color( 0, 1, 0 ) )


func append_text():
	$Label.text += "\nTest String"
