class_name script___object extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Script Object"


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
	var h : script___object_helper = ResourceLoader.load(
		"res://script/script___object_helper.gd"
	).new()
	
	h.functor = ( func(): $Label.text = "Call : script___object_helper::functor" )
	
	h.do()
	
	# Code Edit
	$helper_code.show_code( scene_path().replace( ".tscn", ".gd" ), 26, 32 )
