class_name type___string_find extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "String Find"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_lf()
	pam.add_front( type_root.scene_name(),	Key.KEY_ESCAPE, type_root.scene_path() )
	pam.add_split()
	build_summary( eSceneType.TEST )
	
	#
	#
	#
	var s_1 : String = "1234_1234"
	var s_2 : String = "1234"
	
	$Label.text = (
		  "[S] : " + str( s_1.find( s_2 ) ) +  "    [F] : "   + str( s_1.find( "abcd" ) )
		+ "\n"
		+ str( s_1.find( s_2, s_1.find( s_2 ) + 1 ) )
		+ "\n"
		+ str( s_1.find( s_2, s_1.length() ) )
		+ "\n===================\n"
		+ "[S] : " + str( s_1.rfind( s_2 ) ) +  "    [F] : "   + str( s_1.rfind( "abcd" ) )
		+ "\n"
		+ str( s_1.rfind( s_2, s_1.rfind( s_2 ) - 1 ) )
		+ "\n"
		+ str( s_1.rfind( s_2, s_1.length() ) )
	)
	
	$helper_code.show_code( scene_path().replace( ".tscn", ".gd" ), 27, 42 )
