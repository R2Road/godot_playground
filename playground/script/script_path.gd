class_name script_path extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Script Path"



############################ Override ############################
func _ready():
	pam.set_name( script_path.scene_name() )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_split()
	build_summary( eSceneType.TEST )
