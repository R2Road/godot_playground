class_name NextSceneInfo



############################ Variable ############################
var name : String
var key : Key
var scene_path : String
var action = func dummy():
	pass



############################ Override ############################
func _init( _name : String, _key : Key, _scene_path : String )->void:
	name = _name
	key = _key
	scene_path = _scene_path
	
	action = func ( node : Node ):
		node.get_tree().change_scene_to_file( scene_path )
