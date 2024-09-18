class_name resolution___content_scale_size extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Resolution : Content Scale Size"
	

static func scene_path()->String:
	return super.scene_path()



############################ OnReady #############################
@onready var viewport_size_item_list : ItemList = $CanvasLayer/ViewportSizeItemList



############################ Variable ############################
var viewport_size_list : Dictionary = {
	  "640 x 360" : Vector2i( 640, 360 )
	, "640 x 480" : Vector2i( 640, 480 )
	, "1024 x 768" : Vector2i( 1024, 768 )
	, "1152 x 648" : Vector2i( 1152, 648 )
	, "1280 x 720" : Vector2i( 1280, 720 )
	, "1920 x 1080" : Vector2i( 1920, 1080 )
	, "2560 x 1440" : Vector2i( 2560, 1440 )
}
var default_viewport_size : Vector2i



############################ Override ############################
func _ready()->void:
	pam.set_name( scene_name() )
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	#
	#
	
	default_viewport_size = get_viewport().size
	
	var current_item_index = 0
	for i : String in viewport_size_list:
		viewport_size_item_list.add_item( i )
		
		if default_viewport_size == viewport_size_list[i]:
			viewport_size_item_list.select( current_item_index )
		
		current_item_index += 1


func _exit_tree() -> void:
	get_viewport().size = default_viewport_size
	get_window().content_scale_size = Vector2i.ZERO



############################  Signal  ############################
func _on_viewport_size_item_list_item_selected(index: int) -> void:
	var new_viewport_size = viewport_size_list[viewport_size_item_list.get_item_text( index )]
	get_window().content_scale_size = new_viewport_size
