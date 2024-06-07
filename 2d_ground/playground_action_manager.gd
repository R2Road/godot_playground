class_name PlayGroundActionManager



############################ Variable ############################
var name : String
var container : Array



############################ Override ############################
func _init( _owner : Node, _name : String, _container : Array )->void:
	name = _name
	
	for i in _container:
		assert( null != _owner )
		assert( i is PlayGroundAction )
		
		i.owner = _owner
		container.push_back( i )



############################   User   ############################
func build_summary()->String:
	var ret : String = ( "+ " + name + "\n\n" )
	
	for i in container:
		if Key.KEY_NONE != i.key:
			ret += ( "[" + OS.get_keycode_string( i.key ) + "] " + i.name + "\n" )
		else:
			ret += ( i.name )
	
	return ret


func get_action( keycode : Key )->PlayGroundAction:
	for i in container:
		if i.key == keycode:
			return i
	
	return null


func do( event : InputEvent ):
	if !(event is InputEventKey ):
		return
	
	if !event.is_pressed():
		return
		
	var target_action = get_action( event.keycode )
	if( null == target_action ):
		return
	
	target_action.action.call()
