class_name PlaygroundScene extends Node



############################ Variable ############################
enum eSceneType
{
	ROOT,
	TEST,
}



############################ Variable ############################
var playground_action_manager : PlayGroundActionManager = PlayGroundActionManager.new( self )
var pam  = playground_action_manager # alias



############################ Override ############################
func _init():
	var label = Label.new()
	label.name = "Summary"
	add_child( label )
	
	var fps_label = ResourceLoader.load( "res://base/playground_scene_helper.tscn" ).instantiate()
	fps_label.name = "FPS"
	add_child( fps_label )


func _input( event ):
	playground_action_manager.do( event )



############################   User   ############################
func build_summary( _scene_type : eSceneType ):
	var summary_node = get_node( "Summary" )
	summary_node.text = playground_action_manager.build_summary()
	
	if eSceneType.ROOT == _scene_type:
		summary_node.set_position( 
			( get_viewport().size * 0.5 )
			- ( summary_node.get_minimum_size() * 0.5 )
		)
	
	$FPS.position.y = get_viewport().size.y - $FPS.get_minimum_size().y
