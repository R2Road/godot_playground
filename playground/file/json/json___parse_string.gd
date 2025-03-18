class_name json___parse_string extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Json : parse_string()"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	parse_and_show( $Label_1, "", 0.7, 0.2 )
	parse_and_show( $Label_2, "[1,2,3", 0.7, 0.4 )
	parse_and_show( $Label_3, "[2,3,4]", 0.7, 0.6 )
	parse_and_show( $Label_4, "{ \"v\" : 1 }", 0.7, 0.8 )



############################   User   ############################
func parse_and_show( label : Label, json_string : String, x : float, y : float  ):
	var json = JSON.parse_string( json_string )
	
	if json:
		label.text = (
			"string : " + json_string
			+ "\n"
			+ "result : " + str( json )
		)
	else:
		label.text = (
			"string : " + json_string
			+ "\n"
			+ "json string has problem"
		)
	
	label.set_position(
		Vector2( get_viewport().size.x * x, get_viewport().size.y * y )
		- ( label.get_minimum_size() * label.get_scale() * 0.5 )
	)
	
	# Code Edit
	$helper_code.show_range( scene_path().replace( ".tscn", ".gd" ), 33, 47 )
