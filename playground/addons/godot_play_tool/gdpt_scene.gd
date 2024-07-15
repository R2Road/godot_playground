class_name GDPTScene extends Node



############################ Variable ############################
enum eSceneType
{
	ROOT,
	TEST,
}



############################ Variable ############################
var play_action_manager : GDPTActionManager = GDPTActionManager.new( self )
var pam  = play_action_manager # alias



############################ Override ############################
func _init():
	var canvas_layer = CanvasLayer.new()
	canvas_layer.name = "PlayCanvas"
	add_child( canvas_layer )
	
	var label = Label.new()
	label.name = "Summary"
	canvas_layer.add_child( label )
	
	var fps_label = Label.new()
	fps_label.set_script( ResourceLoader.load( "res://addons/godot_play_tool/gdpt_scene_helper.gd" ) )
	fps_label.name = "FPS"
	canvas_layer.add_child( fps_label )


func _input( event ):
	play_action_manager.do( event )



############################   User   ############################
func build_summary( _scene_type : eSceneType ):
	var summary_node = $PlayCanvas/Summary
	summary_node.text = play_action_manager.build_summary()
	
	if eSceneType.ROOT == _scene_type:
		summary_node.set_position( 
			( get_viewport().size * 0.5 )
			- ( summary_node.get_minimum_size() * 0.5 )
		)
