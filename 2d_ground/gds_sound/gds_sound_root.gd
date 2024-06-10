extends PlaygroundScene



############################ Override ############################
func _init():
	super._init()
	
	scene_type = eSceneType.ROOT
	
	playground_action_manager = PlayGroundActionManager.new( self, "Sound", [
		  PlayGroundAction.new_mover( "Return to Root",  Key.KEY_ESCAPE, "res://playground_main.tscn" )
	] )
