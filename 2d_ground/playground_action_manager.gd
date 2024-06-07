class_name PlayGround_ActionManager



############################ Variable ############################
var container : Array



############################ Override ############################
func _init( _container : Array )->void:
	
	for i in _container:
		assert( i is NextSceneInfo )
		container.push_back( i )



############################   User   ############################
func build_summary( current_scene_name : String )->String:
	var ret : String = ( "+ " + current_scene_name + "\n\n" )
	
	for i in container:
		ret += ( "[" + OS.get_keycode_string( i.key ) + "] " + i.name + "\n" )
	
	return ret


func get_action( keycode : Key )->NextSceneInfo:
	for i in container:
		if i.key == keycode:
			return i
	
	return null


func do( node : Node,  event : InputEvent ):
	if !(event is InputEventKey ):
		return
	
	if !event.is_pressed():
		return
		
	var target_action = get_action( event.keycode )
	if( null == target_action ):
		return
	
	target_action.action.call( node )
