class_name resolution___change_window_size extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Resolution : Change Window Size"
	

static func scene_path()->String:
	return super.scene_path()



############################ Variable ############################
var resolution_list : Dictionary = {
	  "640 x 480" : Vector2( 640, 480 )
	, "1024 x 768" : Vector2( 1024, 768 )
	, "1280 x 720" : Vector2( 1280, 720 )
	, "1920 x 1080" : Vector2( 1920, 1080 )
}



############################ Override ############################
func _ready()->void:
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_split()
	build_summary( eSceneType.TEST )
	
	#
	#
	#
	for i in resolution_list:
		$CanvasLayer/ItemList.add_item( i )


func _on_item_list_item_selected( index: int )->void:
	var new_resolution = resolution_list[$CanvasLayer/ItemList.get_item_text( index )]
	get_window().size = new_resolution
