class_name resolution___change_window_size extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Resolution : Change Window Size"
	

static func scene_path()->String:
	return super.scene_path()



############################ OnReady #############################
@onready var resolution_item_list : ItemList = $CanvasLayer/ResolutionItemList
@onready var content_scale_mode_item_list : ItemList = $CanvasLayer/ContentScaleModeItemList



############################ Variable ############################
var resolution_list : Dictionary = {
	  "640 x 480" : Vector2i( 640, 480 )
	, "1024 x 768" : Vector2i( 1024, 768 )
	, "1152 x 648" : Vector2i( 1152, 648 )
	, "1280 x 720" : Vector2i( 1280, 720 )
	, "1920 x 1080" : Vector2i( 1920, 1080 )
}
var content_scale_mode_list : Dictionary = {
	  "Disabled" : Window.ContentScaleMode.CONTENT_SCALE_MODE_DISABLED
	, "Canvas Items" : Window.ContentScaleMode.CONTENT_SCALE_MODE_CANVAS_ITEMS
	, "Viewport" : Window.ContentScaleMode.CONTENT_SCALE_MODE_VIEWPORT
}
var default_resolution : Vector2i
var default_content_scale_mode : Window.ContentScaleMode



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
	
	default_resolution = get_viewport().size
	default_content_scale_mode = get_tree().root.content_scale_mode
	
	var current_item_index = 0
	for i in resolution_list:
		resolution_item_list.add_item( i )
		
		if default_resolution == resolution_list[i]:
			resolution_item_list.select( current_item_index )
		
		current_item_index += 1
	
	current_item_index = 0
	for i in content_scale_mode_list:
		content_scale_mode_item_list.add_item( i )
		
		if default_content_scale_mode == content_scale_mode_list[i]:
			content_scale_mode_item_list.select( current_item_index )
		
		current_item_index += 1


func _exit_tree() -> void:
	get_window().size = default_resolution
	get_tree().root.content_scale_mode = default_content_scale_mode



############################  Signal  ############################
func _on_resolution_item_list_item_selected( index: int )->void:
	var new_resolution = resolution_list[resolution_item_list.get_item_text( index )]
	get_window().size = new_resolution


func _on_content_scale_mode_item_list_item_selected(index: int) -> void:
	var new_content_scale_mode = content_scale_mode_list[content_scale_mode_item_list.get_item_text( index )]
	get_tree().root.content_scale_mode = new_content_scale_mode
