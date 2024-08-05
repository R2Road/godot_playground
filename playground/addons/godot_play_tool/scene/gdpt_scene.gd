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


static func scene_path()->String:
	return get_stack()[1]["source"].replace( ".gd", ".tscn" )



############################ Override ############################
func _init():
	add_child( GDPT.build_scene_helper() )
	
	pam = $GDPTSceneHelper.play_action_manager
	pam.owner = self



############################   User   ############################
func build_summary( _scene_type : eSceneType ):
	var summary_node = $GDPTSceneHelper/Summary
	summary_node.text = pam.build_summary()
	
	if eSceneType.ROOT == _scene_type:
		summary_node.set_position( 
			( get_viewport().size * 0.5 )
			- ( summary_node.get_minimum_size() * 0.5 )
		)
