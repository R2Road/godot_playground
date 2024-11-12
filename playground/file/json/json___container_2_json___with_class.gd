class_name json___container_2_json___with_class extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Json : Container 2 Json : with Class" 


static func scene_path()->String:
	return super.scene_path()



### Variable #####################################################
class Test extends RefCounted:
	var a : int = 1
	
	func _to_string() -> String:
		return "abcd"



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_message( "_to_string() 함수는 Object Class 에 위치한다." )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#	
	var t = Test.new()
	print( str( t ) )
	
	var d = { "data" = t }
	container_2_json_string( $Label,      0.7, 0.2, "    ", d )
	
	# Code Edit
	$helper_code1.show_code( scene_path().replace( ".tscn", ".gd" ), 16, 20 )
	$helper_code2.show_code( scene_path().replace( ".tscn", ".gd" ), 36, 40 )



############################   User   ############################
func container_2_json_string( label : Label, x_rate : float, y_rate : float, indent_string : String, container )->void:
	var s = JSON.stringify( container, indent_string )
	
	label.text = s
	label.set_position(
		Vector2( get_viewport().size.x * x_rate, get_viewport().size.y * y_rate )
		- ( label.get_minimum_size() * label.get_scale() * 0.5 )
	)
