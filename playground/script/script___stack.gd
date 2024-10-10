class_name script___stack extends GDPTScene



############################ Variable ############################
		

######################### GDPT Override ##########################
static func scene_name()->String:
	return "Script Stack"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	build_summary( eSceneType.TEST )
	
	#
	#
	#
	show_stack()
	$helper_code.show_code( "res://script/script___stack.gd", 35, 43 )



############################   User   ############################
func show_stack():
	$Label.text = "+ Script Stack"
	$Label.text += "\n\n"
	
	for i in get_stack():
		$Label.text += i["source"] + " : " + i["function"]
		$Label.text += "\n"
	$Label/helper_move2center.do()
