class_name inspector_struct extends GDPTScene



############################ Variable ############################
@export var container : Array[InspectorStructHelper]


######################### GDPT Override ##########################
static func scene_name()->String:
	return "Inspector : Struct"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( inspector_struct.scene_name() )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
