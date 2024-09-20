class_name json_parse extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Json : parse()"


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
	parse_and_show( $Label_1, "", 0.5, 0.2 )
	parse_and_show( $Label_2, "[\n1,\n2,\n3", 0.5, 0.4 )
	parse_and_show( $Label_3, "[2,3,4]", 0.5, 0.6 )
	parse_and_show( $Label_4, "[2, 3, 4, 5, 6, ]", 0.5, 0.8 )



############################   User   ############################
func parse_and_show( label_node : Label, json_string : String, x : float, y : float  ):
	var j = JSON.new()
	var error = j.parse( json_string )
	
	if OK == error:
		label_node.text = (
			"string : " + json_string
			+ "\n"
			+ "result : " + str( j.data )
		)
	else:
		label_node.text = (
			"string : " + json_string
			+ "\n"
			+ "error : " + j.get_error_message() + "   line : " + str( j.get_error_line() )
		)
	
	label_node.set_position(
		Vector2( get_viewport().size.x * x, get_viewport().size.y * y )
		- ( label_node.get_minimum_size() * label_node.get_scale() * 0.5 )
	)
