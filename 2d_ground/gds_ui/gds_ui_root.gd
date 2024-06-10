extends PlaygroundScene



############################ Override ############################
func _init():
	super._init()
	
	scene_type = eSceneType.ROOT
	
	playground_action_manager = PlayGroundActionManager.new( self, "UI", [
		  PlayGroundAction.new_mover( "Return to Root",  Key.KEY_ESCAPE, "res://playground_main.tscn" )
		, PlayGroundAction.new_mover( "Label",  Key.KEY_1, "res://gds_ui/gds_ui_LabelScene.tscn" )
	] )
