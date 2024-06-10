class_name PlaygroundScene extends Node



############################ Variable ############################
enum eSceneType
{
	ROOT,
	TEST,
}



############################ Variable ############################
var scene_type : eSceneType = eSceneType.TEST
var playground_action_manager : PlayGroundActionManager



############################ Override ############################
func _init():
	var label = Label.new()
	label.name = "Summary"
	add_child( label )
	
	
func _ready():
	set_process_input( true ) # is not need : default on
	
	var summary_node = get_node( "Summary" )
	summary_node.text = playground_action_manager.build_summary()
	
	if eSceneType.ROOT == scene_type:
		summary_node.set_position(
			Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.5 )
			- Vector2( summary_node.get_minimum_size().x * 0.5, summary_node.get_minimum_size().y * 0.5 )
		)


func _input( event ):
	playground_action_manager.do( event )