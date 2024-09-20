class_name config___file_load extends GDPTScene



############################ Variable ############################
var path = "res://file/config/config___section_helper.cfg"
var config = ConfigFile.new()



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
	
	# File Name
	$Label4FileName.text = ( "File : " + path )
	$Label4FileName.position = Vector2(
		  ( ( get_viewport().size.x * 0.5 ) - ( $Label4FileName.get_minimum_size().x * 0.5 ) )
		, ( get_viewport().size.y * 0.2 )
	)
	
	# File Load
	config.load( path )
	
	# Show Section List
	$Label4Sections.text = ( "+ Section List" + "\n" )
	$Label4Sections.text += "\n"
	for s in config.get_sections():
		$Label4Sections.text += s
		$Label4Sections.text += "\n"	
	
