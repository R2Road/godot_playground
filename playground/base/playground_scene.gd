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
	var canvas_layer = CanvasLayer.new()
	canvas_layer.name = "PGCanvas"
	add_child( canvas_layer )
	
	var label = Label.new()
	label.name = "Summary"
	canvas_layer.add_child( label )
	
	var fps_label = Label.new()
	fps_label.set_script( ResourceLoader.load( "res://base/playground_scene_helper.gd" ) )
	fps_label.name = "FPS"
	canvas_layer.add_child( fps_label )


func _input( event ):
	playground_action_manager.do( event )



############################   User   ############################
func build_summary( _scene_type : eSceneType ):
	var summary_node = $PGCanvas/Summary
	summary_node.text = playground_action_manager.build_summary()
	
	if eSceneType.ROOT == _scene_type:
		summary_node.set_position( 
			( get_viewport().size * 0.5 )
			- ( summary_node.get_minimum_size() * 0.5 )
		)
