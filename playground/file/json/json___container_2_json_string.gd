class_name json___container_2_json_string extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Json : Container 2 Json String" 


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
	container_2_json_string( $Array,      0.5, 0.2, "", [ "a", "b", "c" ] )
	container_2_json_string( $Dictionary, 0.5, 0.3, "", { "a" = 1, "b" = 2, "c" = 3 } )
	container_2_json_string( $Indent,     0.5, 0.6, "     ", { "a" = 1, "b" = 2, "c" = 3, "d" = [1, 2, 3, 4] } )



############################   User   ############################
func container_2_json_string( label : Label, x_rate : float, y_rate : float, indent_string : String, container )->void:
	var s = JSON.stringify( container, indent_string )
	
	label.text = s
	label.set_position(
		Vector2( get_viewport().size.x * x_rate, get_viewport().size.y * y_rate )
		- ( label.get_minimum_size() * label.get_scale() * 0.5 )
	)
