class_name NextSceneManager



############################ Variable ############################
var container : Array



############################ Override ############################
func _init( _container : Array )->void:
	
	for i in _container:
		assert( i is NextSceneInfo )
		container.push_back( i )



############################   User   ############################
func build_summary( current_scene_name : String )->String:
	var ret : String
	
	ret = "+ " + current_scene_name + "\n\n"
	
	for i in container:
		ret += ( "[" + OS.get_keycode_string( i.key ) + "] " + i.name + "\n" )
	
	return ret


func get_next_scene( keycode : Key )->String:
	for i in container:
		if i.key == keycode:
			return i.scene_path
	
	return ""
