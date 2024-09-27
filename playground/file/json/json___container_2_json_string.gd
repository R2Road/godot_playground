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
	array_2_json_string()
	dictionary_2_json_string()
	apply_indent()



############################   User   ############################
func array_2_json_string():
	var a : Array = [ "a", "b", "c" ]
	var s = JSON.stringify( a )
	
	$Array.text = s
	$Array.set_position(
		Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.2 )
		- ( $Array.get_minimum_size() * $Array.get_scale() * 0.5 )
	)


func dictionary_2_json_string():
	var d : Dictionary = { "a" = 1, "b" = 2, "c" = 3 }
	var s = JSON.stringify( d )
	
	$Dictionary.text = s
	$Dictionary.set_position(
		Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.3 )
		- ( $Dictionary.get_minimum_size() * $Dictionary.get_scale() * 0.5 )
	)


func apply_indent():
	var d : Dictionary = { "a" = 1, "b" = 2, "c" = 3, "d" = [1, 2, 3, 4] }
	var s = JSON.stringify( d, "        " )
	
	$Indent.text = s
	$Indent.set_position(
		Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.6 )
		- ( $Indent.get_minimum_size() * $Indent.get_scale() * 0.5 )
	)
	
	# Label 은 \t를 정상 출력하지 못한다
	s = JSON.stringify( d, "\t" )
	print( s )
