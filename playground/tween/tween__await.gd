class_name tween__await extends GDPTScene



### GDPT Override ################################################
static func scene_name()->String:
	return "Tween : Await"


static func scene_path()->String:
	return super.scene_path()



### Override #####################################################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_split()
	pam.add_action( "do", KEY_1, do )
	build_summary( eSceneType.TEST )
	
	#
	#
	#
	$helper_code.show_code( scene_path().replace( ".tscn", ".gd" ), 32, 38 )



### Interface ####################################################
func do()->void:
	$helper_circle.color = Color.RED
	
	var tween : Tween = create_tween()
	await tween.tween_interval( 1 ).finished
	
	$helper_circle.color = Color.GREEN
