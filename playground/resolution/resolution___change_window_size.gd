class_name resolution___change_window_size extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Resolution : Change Window Size"
	

static func scene_path()->String:
	return super.scene_path()



############################ Variable ############################
var resolution_list : Dictionary = {
	  "640 x 480" : Vector2i( 640, 480 )
	, "1024 x 768" : Vector2i( 1024, 768 )
	, "1152 x 648" : Vector2i( 1152, 648 )
	, "1280 x 720" : Vector2i( 1280, 720 )
	, "1920 x 1080" : Vector2i( 1920, 1080 )
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
	var current_resolution = get_viewport().size
	var current_item_index = 0
	for i in resolution_list:
		$CanvasLayer/ItemList.add_item( i )
		
		if current_resolution == resolution_list[i]:
			$CanvasLayer/ItemList.select( current_item_index )
		
		current_item_index += 1


func _on_item_list_item_selected( index: int )->void:
	var new_resolution = resolution_list[$CanvasLayer/ItemList.get_item_text( index )]
	get_window().size = new_resolution
