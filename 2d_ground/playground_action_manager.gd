class_name PlayGroundActionManager



############################ Variable ############################
var owner : Node
var name : String
var container : Array



############################ Override ############################
func _init( _owner : Node )->void:
	assert( null != _owner )
	owner = _owner



############################   User   ############################
func set_name( _name : String ):
	name = _name


func add_exit():
	container.push_back( PlayGroundAction.new_exit( owner ) )


func add_mover( _name : String, _key : Key, _scene_path : String ):
	container.push_back( PlayGroundAction.new_mover( owner, _name, _key, _scene_path ) )


func add_action( _name : String, _key : Key, _functor : Callable ):
	container.push_back( PlayGroundAction.new_action( _name, _key, _functor ) )


func add_lf():
	container.push_back( PlayGroundAction.new_lf() )


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
	
	target_action.action.call_deferred()
