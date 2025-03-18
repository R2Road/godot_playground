class_name script___property_list extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Script : Property List"

static func scene_path()->String:
	return super.scene_path()



### Export #######################################################
@export var helper_code : GDPTHelper_Code
@export var label : Label



############################ Variable ############################
var helper_script_resource = preload( "res://script/script___property_list_helper.gd" )
var helper



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
	helper_code.show_range( "res://script/script___property_list_helper.gd", 0, 25 )



############################   User   ############################
func show_simply():
	label.text = ""
	
	label.text += "+ Script Property"
	label.text += "\n\n"
	for p in helper.get_script().get_script_property_list():
		label.text += "name : " + p["name"]
		label.text += "    "
		label.text += "type : " + str( p["type"] )
		label.text += "    "
		label.text += "class name : " + str( p["class_name"] )
		label.text += "\n"
	
	
	label.text += "\n\n\n"
	
	
	label.text += "+ Script Function"
	label.text += "\n\n"
	for p in helper.get_script().get_script_method_list():
		label.text += "name : " + p["name"]
		label.text += "    "
		label.text += "return type : " + str( p["return"]["type"] )
		label.text += "\n"


func show_full():
	label.text = ""
	
	label.text += "+ Script Property"
	label.text += "\n\n"
	for p in helper.get_script().get_script_property_list():
		label.text += str( p )
		label.text += "\n"
	
	
	label.text += "\n\n\n"
	
	
	label.text += "+ Script Function"
	label.text += "\n\n"
	for p in helper.get_script().get_script_method_list():
		label.text += str( p )
		label.text += "\n"
