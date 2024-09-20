class_name config___parse extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Config : Parse"


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
	
	var source_string = "
		[TEst]
		name = \"is name\"
	"
	
	# Ready
	var config = ConfigFile.new()
	
	# Parse
	var parse_result = config.parse( source_string )
	if Error.OK != parse_result:
		GDPT._assert_f()
	
	# Encode 2 Text
	$Label4Encode.text = ( "+ config.encode_to_text()" + "\n" )
	$Label4Encode.text += "\n"
	$Label4Encode.text += config.encode_to_text()
	
	# Source String
	$Label4Source.text = ( "+ Source String" + "\n" )
	$Label4Source.text += "\n"
	$Label4Source.text += source_string
	
	# Code Edit
	$helper_code.show_code( scene_path().replace( ".tscn", ".gd" ), 26, 37 )
