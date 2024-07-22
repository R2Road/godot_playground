class_name config_section extends GDPTScene



############################ Variable ############################
var path = "res://config/config_section_helper.cfg"
var config = ConfigFile.new()



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Config : Section"



############################ Override ############################
func _ready():
	pam.set_name( config_section.scene_name() )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	config.load( path )
	
	for s in config.get_sections():
		$Label.text += s
		$Label.text += "\n"
	
	
