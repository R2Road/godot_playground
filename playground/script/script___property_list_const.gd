class_name script___property_list_const extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Script : Property List : Const"


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
	pam.add_message( "Const 멤버는 Script 객체의 get_script_constant_map() 으로 접근한다." )
	pam.add_lf()
	build_summary( eSceneType.TEST )
	
	# Code Edit
	$CanvasLayer/helper_code.show_range( scene_path().replace( ".tscn", "___helper.gd" ), 1, 10 )
	$CanvasLayer/helper_code2.show_range( scene_path().replace( ".tscn", ".gd" ), 38, 40 )



############################   User   ############################
func do()->void:
	#
	# Setup 2 Resource Class
	#
	var helper_script : Script = script___property_list_const___helper.new().get_script()
	for c in helper_script.get_script_constant_map():
		$CanvasLayer/helper_output.print( c )
