class_name resolution___viewport_size extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Resolution : Viewport Size"
	

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
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_subject( "Godot 엔진은 실행중에 Viewport Size를 바꿀 방법이 없다. 2024/10/15" )
	pam.add_note( "지정한 크기에 맞추어 Window Size는 변한다." )
	pam.add_note( "지정한 크기에 맞추어 Viewport Size는 변하지 않는다." )
	pam.add_note( "Project Settings 에 지정된 크기가 변하지 않는다." )
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



############################  Signal  ############################
func _on_viewport_size_item_list_item_selected(index: int) -> void:
	var new_viewport_size = viewport_size_list[viewport_size_item_list.get_item_text( index )]
	get_viewport().set_size( new_viewport_size )
