class_name control_nine_patch_rect_basic extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Nine Patch Rect : Basic"


static func scene_path()->String:
	return super.scene_path()



############################ Variable ############################
@onready var target_node = $NinePatchRect



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	$HSlider_W.value = target_node.texture.get_width()
	$HSlider_H.value = target_node.texture.get_height()
	target_node.size.x = target_node.texture.get_width()
	target_node.size.y = target_node.texture.get_height()
	target_node.get_node_or_null( "helper_move2center" ).do()



########################## Signal Func ###########################
func _on_h_slider_w_value_changed( _value ):
	target_node.size.x = $HSlider_W.value
	target_node.get_node_or_null( "helper_move2center" ).do()


func _on_h_slider_h_value_changed( _value ):
	target_node.size.y = $HSlider_H.value
	target_node.get_node_or_null( "helper_move2center" ).do()
