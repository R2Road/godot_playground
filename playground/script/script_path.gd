class_name script_path extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Script Path"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( script_path.scene_name() )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	build_summary( eSceneType.TEST )
	
	#
	#
	#
	$Label.text = "get path in static func : " + script_path.scene_path()
	$Label.text += "\n\n"
	$Label.text += "get path in script obj : " + get_script().get_path()
	$Label/helper_move2center.do()
