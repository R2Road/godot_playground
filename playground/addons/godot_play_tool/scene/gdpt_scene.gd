class_name GDPTScene extends Node2D



############################ Variable ############################
enum eSceneType
{
	ROOT,
	TEST,
}



############################ Variable ############################
var pam : GDPTActionManager



######################### GDPT Override ##########################
static func scene_name()->String:
	return "GDPTScene"



############################ Override ############################
func _init():
	var canvas_layer = CanvasLayer.new()
	canvas_layer.name = "PlayCanvas"
	canvas_layer.set_script( GDPT.scene_helper )
	add_child( canvas_layer )
	
	pam = canvas_layer.play_action_manager
	pam.owner = self



############################   User   ############################
func build_summary( _scene_type : eSceneType ):
	var summary_node = $PlayCanvas/Summary
	summary_node.text = pam.build_summary()
	
	if eSceneType.ROOT == _scene_type:
		summary_node.set_position( 
			( get_viewport().size * 0.5 )
			- ( summary_node.get_minimum_size() * 0.5 )
		)
