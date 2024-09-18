class_name resolution___option_test extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Resolution : Option Test"
	

static func scene_path()->String:
	return super.scene_path()



############################ OnReady #############################
@onready var resolution_item_list : ItemList = $CanvasLayer/ResolutionItemList
@onready var content_scale_mode_item_list : ItemList = $CanvasLayer/ContentScaleModeItemList
@onready var content_scale_aspect_item_list : ItemList = $CanvasLayer/ContentScaleAspectItemList
@onready var content_scale_factor_item_list : ItemList = $CanvasLayer/ContentScaleFactorItemList



############################ Variable ############################
var resolution_list : Dictionary = {
	  "640 x 360" : Vector2i( 640, 360 )
	, "640 x 480" : Vector2i( 640, 480 )
	, "1024 x 768" : Vector2i( 1024, 768 )
	, "1152 x 648" : Vector2i( 1152, 648 )
	, "1280 x 720" : Vector2i( 1280, 720 )
	, "1920 x 1080" : Vector2i( 1920, 1080 )
	, "2560 x 1440" : Vector2i( 2560, 1440 )
}
var content_scale_mode_list : Dictionary = {
	  "Disabled" : Window.ContentScaleMode.CONTENT_SCALE_MODE_DISABLED
	, "Canvas Items" : Window.ContentScaleMode.CONTENT_SCALE_MODE_CANVAS_ITEMS
	, "Viewport" : Window.ContentScaleMode.CONTENT_SCALE_MODE_VIEWPORT
}
var content_scale_aspect_list : Dictionary = {
	  "Ignore" : Window.ContentScaleAspect.CONTENT_SCALE_ASPECT_IGNORE
	, "Keep" : Window.ContentScaleAspect.CONTENT_SCALE_ASPECT_KEEP
	, "Keep : Width" : Window.ContentScaleAspect.CONTENT_SCALE_ASPECT_KEEP_WIDTH
	, "Keep : Height" : Window.ContentScaleAspect.CONTENT_SCALE_ASPECT_KEEP_HEIGHT
	, "Expand" : Window.ContentScaleAspect.CONTENT_SCALE_ASPECT_EXPAND
}
var content_scale_factor_list : Dictionary = {
	  "0.5" : 0.5
	, "0.6" : 0.6
	, "0.7" : 0.7
	, "0.8" : 0.8
	, "0.9" : 0.9
	, "1" : 1
	, "1.5" : 1.5
	, "2" : 2
	, "2.5" : 2.5
}
var default_resolution : Vector2i
var default_content_scale_mode : Window.ContentScaleMode
var default_content_scale_aspect : Window.ContentScaleAspect
var default_content_scale_factor : float



############################ Override ############################
func _ready()->void:
	pam.set_name( scene_name() )
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_message( "Viewport + Expand가 내 의도에 가장 부합한다." )
	pam.add_message( "화면을 부드럽게 바꾸고 싶다면 Viewport를 Canvas Item으로 바꿔라." )
	build_summary( eSceneType.TEST )
	
	#
	#
	#
	
	default_resolution = get_viewport().size
	default_content_scale_mode = get_tree().root.content_scale_mode
	default_content_scale_aspect = get_tree().root.content_scale_aspect
	default_content_scale_factor = get_tree().root.content_scale_factor
	
	var current_item_index = 0
	for i : String in resolution_list:
		resolution_item_list.add_item( i )
		
		if default_resolution == resolution_list[i]:
			resolution_item_list.select( current_item_index )
		
		current_item_index += 1
	
	current_item_index = 0
	for i : String in content_scale_mode_list:
		content_scale_mode_item_list.add_item( i )
		
		if default_content_scale_mode == content_scale_mode_list[i]:
			content_scale_mode_item_list.select( current_item_index )
		
		current_item_index += 1
	
	current_item_index = 0
	for i : String in content_scale_aspect_list:
		content_scale_aspect_item_list.add_item( i )
		
		if default_content_scale_aspect == content_scale_aspect_list[i]:
			content_scale_aspect_item_list.select( current_item_index )
		
		current_item_index += 1
	
	current_item_index = 0
	for i : String in content_scale_factor_list:
		content_scale_factor_item_list.add_item( i )
		
		if default_content_scale_factor == content_scale_factor_list[i]:
			content_scale_factor_item_list.select( current_item_index )
		
		current_item_index += 1


func _exit_tree() -> void:
	get_window().size = default_resolution
	get_tree().root.content_scale_mode = default_content_scale_mode
	get_tree().root.content_scale_aspect = default_content_scale_aspect
	get_tree().root.content_scale_factor = default_content_scale_factor



############################  Signal  ############################
func _on_resolution_item_list_item_selected( index: int )->void:
	var new_resolution = resolution_list[resolution_item_list.get_item_text( index )]
	get_window().size = new_resolution


func _on_content_scale_mode_item_list_item_selected(index: int) -> void:
	var new_content_scale_mode = content_scale_mode_list[content_scale_mode_item_list.get_item_text( index )]
	get_tree().root.content_scale_mode = new_content_scale_mode


func _on_content_scale_aspect_item_list_item_selected(index: int) -> void:
	var new_content_scale_aspect = content_scale_aspect_list[content_scale_aspect_item_list.get_item_text( index )]
	get_tree().root.content_scale_aspect = new_content_scale_aspect


func _on_content_scale_factor_item_list_item_selected(index: int) -> void:
	var new_content_scale_factor = content_scale_factor_list[content_scale_factor_item_list.get_item_text( index )]
	get_tree().root.content_scale_factor = new_content_scale_factor
