class_name file_path___handling extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "File Path : Handling"


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
	do()
	
	# Code Edit
	$helper_code.show_code( scene_path().replace( ".tscn", ".gd" ), 33, 51 )



############################   User   ############################
func do()->void:
	var file_path : String = "res://file/file_root.abcdefg.gd"
	
	print( file_path.get_file() )
	print( file_path.get_extension() )
	print( file_path.get_file().substr( file_path.get_file().find( "." ) ) )
