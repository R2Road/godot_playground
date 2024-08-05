class_name script_stack extends GDPTScene



############################ Variable ############################
		

######################### GDPT Override ##########################
static func scene_name()->String:
	return "Script Stack"


static func scene_path()->String:
	var s : String = get_stack()[0]["source"]
	return s



############################ Override ############################
func _ready():
	pam.set_name( script_stack.scene_name() )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	build_summary( eSceneType.TEST )
	
	#
	#
	#
	show_stack()



############################   User   ############################
func show_stack():
	$Label.text = "+ Script Stack"
	$Label.text += "\n\n"
	
	for i in get_stack():
		$Label.text += i["source"] + " : " + i["function"]
		$Label.text += "\n"
	$Label/helper_move2center.do()
