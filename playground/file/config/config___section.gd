class_name config___section extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Config : Section"


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
	
	var source_string : String = "
		[section_1]
		name = \"a b c d e f g\"
		age = 10
		position = Vector2( 10, 222 )

		[section_2]
		name = \"1 2 3 4 5\"
		age = 20
		position = Vector2( 222, 10 )

		[section_3]
	"
	
	# Ready
	var config = ConfigFile.new()
	
	# Parse
	config.parse( source_string )
	
	$Label4Sections.text = "+ get_sections()"
	$Label4Sections.text += "\n"
	$Label4Sections.text += "\n"
	
	# Show Sections
	for s in config.get_sections():
		$Label4Sections.text += s
		$Label4Sections.text += "\n"
	
	# Source String
	$Label4Source.text = ( "+ Source String" + "\n" )
	$Label4Source.text += "\n"
	$Label4Source.text += source_string
	
	# Code Edit
	$helper_code.show_code( scene_path().replace( ".tscn", ".gd" ), 40, 53 )
	
