class_name gdscript___string_duplicate extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "String Duplicate"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_split()
	build_summary( eSceneType.TEST )
	
	#
	#
	#
	var s_1 : String = "1234"
	var s_2 : String = s_1
	
	s_1 = "abcd"
	
	$Label.text = (
		  "s_1 : " + s_1
		+ "\n"
		+ "s_2 : " + s_2
	)
	
	$helper_code.show_range( scene_path().replace( ".tscn", ".gd" ), 27, 36 )
