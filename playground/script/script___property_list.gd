class_name script___property_list extends GDPTScene



############################ Variable ############################
var helper_script_resource = preload( "res://script/script___property_list_helper.gd" )
var helper



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Script : Property List"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "simple view", Key.KEY_1, show_simply )
	pam.add_action( "full view", Key.KEY_2, show_full )
	pam.add_lf()
	pam.add_message( "class 내부에 정의된 class는 이름이 제대로 표시되지 않는다." )
	pam.add_message( "array 타입의 경우 지정된 데이터 타입을 hint_string 에 저장한다." )
	pam.add_message( "@export 의경우 usage가 4102" )
	pam.add_lf()
	build_summary( eSceneType.TEST )
	
	#
	#
	#
	helper = RefCounted.new()
	helper.set_script( helper_script_resource )
	
	show_simply()
	$helper_code.show_code( "res://script/script___property_list_helper.gd", 0, 25 )



############################   User   ############################
func show_simply():
	$Label.text = ""
	
	$Label.text += "+ Script Property"
	$Label.text += "\n\n"
	for p in helper.get_script().get_script_property_list():
		$Label.text += "name : " + p["name"]
		$Label.text += "    "
		$Label.text += "type : " + str( p["type"] )
		$Label.text += "    "
		$Label.text += "class name : " + str( p["class_name"] )
		$Label.text += "\n"
	
	
	$Label.text += "\n\n\n"
	
	
	$Label.text += "+ Script Function"
	$Label.text += "\n\n"
	for p in helper.get_script().get_script_method_list():
		$Label.text += "name : " + p["name"]
		$Label.text += "    "
		$Label.text += "return type : " + str( p["return"]["type"] )
		$Label.text += "\n"
	
	$Label/helper_move2center.do()


func show_full():
	$Label.text = ""
	
	$Label.text += "+ Script Property"
	$Label.text += "\n\n"
	for p in helper.get_script().get_script_property_list():
		$Label.text += str( p )
		$Label.text += "\n"
	
	
	$Label.text += "\n\n\n"
	
	
	$Label.text += "+ Script Function"
	$Label.text += "\n\n"
	for p in helper.get_script().get_script_method_list():
		$Label.text += str( p )
		$Label.text += "\n"
	
	$Label/helper_move2center.do()
