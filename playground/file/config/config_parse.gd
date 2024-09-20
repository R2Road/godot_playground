class_name config_parse extends GDPTScene



############################ Variable ############################
var config_string = "
	[TEst]
	name = \"is name\"
"



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Config : Parse"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( config_parse.scene_name() )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	var config = ConfigFile.new()
	config.parse( config_string )
	
	$Label.text = ( "[get_sections()]" + "\n" )
	$Label.text += "\n"
	$Label.text += "\n"
	
	for s in config.get_sections():
		$Label.text += s
		$Label.text += "\n"
	
	#
	#
	#
	$Label4Source.text = ( "<Source String>" + "\n" )
	$Label4Source.text += "\n"
	$Label4Source.text += config_string
	
	
