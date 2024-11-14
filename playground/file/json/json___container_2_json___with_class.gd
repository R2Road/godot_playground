class_name json___container_2_json___with_class extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Json : Container 2 Json : with Class" 


static func scene_path()->String:
	return super.scene_path()



### Variable #####################################################
class Test_1 extends RefCounted:
	var a : int = 1


class Test_2 extends RefCounted:
	var a : int = 2
	
	func _to_string() -> String:
		return "Test 2"



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_note( "Object._to_string() 함수를 활용하면 사용자 정의 Class도 Json으로 출력 된다." )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#	
	var t_1 = Test_1.new()
	print( str( t_1 ) )
	
	var t_2 = Test_2.new()
	print( str( t_2 ) )
	
	var d = {
		"test_1" = t_1,
		"test_2" = t_2
	}
	container_2_json_string( $Label,      0.2, 0.5, "    ", d )
	
	# Code Edit
	$helper_code1.show_code( scene_path().replace( ".tscn", ".gd" ), 16, 24 )
	$helper_code2.show_code( scene_path().replace( ".tscn", ".gd" ), 40, 50 )



############################   User   ############################
func container_2_json_string( label : Label, x_rate : float, y_rate : float, indent_string : String, container )->void:
	var s = JSON.stringify( container, indent_string )
	
	label.text = s
	label.set_position(
		Vector2( get_viewport().size.x * x_rate, get_viewport().size.y * y_rate )
		- ( label.get_minimum_size() * label.get_scale() * 0.5 )
	)
