class_name NextSceneManager



############################ Variable ############################
var container : Array



############################ Override ############################
func _init( _container : Array )->void:
	
	for i in _container:
		assert( i is NextSceneInfo )
		container.push_back( i )



############################   User   ############################
func get_next_scene( keycode : Key )->String:
	for i in container:
		if i.key == keycode:
			return i.scene_path
	
	return ""
