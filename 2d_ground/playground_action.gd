class_name PlayGroundAction



############################ Variable ############################
var name : String
var key : Key
var action = func dummy():
	pass



############################ Override ############################
func _init( _name : String, _key : Key, _scene_path : String )->void:
	name = _name
	key = _key
	
	action = func ( node : Node ):
		node.get_tree().change_scene_to_file( _scene_path )
