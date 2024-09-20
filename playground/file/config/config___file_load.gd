class_name config___file_load extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Config : File Load"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	
	# Ready
	var config = ConfigFile.new()
	
	# File Load
	var path = "res://file/config/config___file_load_helper.cfg"
	var load_result = config.load( path )
	
	# Show
	if Error.OK == load_result:
		$Label4FileContent.text = "+ Load Succeed | " + path
		$Label4FileContent.text += "\n\n"
		$Label4FileContent.text += "+ Content"
		$Label4FileContent.text += "\n"
		$Label4FileContent.text += config.encode_to_text()
	else:
		$Label4FileContent.text = "+ Load Failed | " + path
	
	# Code Edit
	$helper_code.show_code( "res://file/config/config___file_load.gd", 26, 41 )
	
