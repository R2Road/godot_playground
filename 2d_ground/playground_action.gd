class_name PlayGroundAction



############################ Variable ############################
var name : String
var key : Key
var action = func dummy():
	pass



############################   User   ############################
static func new_mover( _name : String, _key : Key, _scene_path : String )->PlayGroundAction:
	var ret = PlayGroundAction.new()
	
	ret.name = _name
	ret.key = _key	
	ret.action = func ( node : Node ):
		node.get_tree().change_scene_to_file( _scene_path )
	
	return ret
