class_name NextSceneManager



############################ Variable ############################
var container : Array



############################ Override ############################
func _init( _container : Array )->void:
	
	for i in _container:
		if i is NextSceneInfo:
			container.push_back( i )
		else:
			assert( false )
