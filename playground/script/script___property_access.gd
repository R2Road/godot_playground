class_name script___property_access extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Script : Property Access"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "do", Key.KEY_1, do )
	pam.add_lf()
	pam.add_message( "Table을 읽어서 Resource 객체에 할당할 경우를 대비한 테스트." )
	pam.add_message( "리플렉션 느낌의 Property 접근 기능은 Object Class에서 제공한다." )
	pam.add_lf()
	build_summary( eSceneType.TEST )
	
	# Code Edit
	$helper_code.show_code( scene_path().replace( ".tscn", ".gd" ), 35, 47 )



############################   User   ############################
func do()->void:
	#
	# Json Data
	#
	var dic : Dictionary = JSON.parse_string( "{ \"i\" : 123 }" )
	
	#
	# Setup 2 Resource Class
	#
	var helper = script___property_access_helper.new()
	print( helper.get( "i" ) )
	
	helper.set( "i", dic["i"] )
	print( helper.get( "i" ) )
