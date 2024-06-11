class_name PlayGroundActionManager



############################ Variable ############################
var owner : Node
var name : String
var container : Array

var last_scene_path : String
var last_scene_name : String



############################ Override ############################
func _init( _owner : Node )->void:
	assert( null != _owner )
	owner = _owner



############################   User   ############################
func set_name( _name : String ):
	name = _name


func add_exit():
	container.push_back( PlayGroundAction.new_exit( owner ) )


func add_back( _key : Key ):
	container.push_back( PlayGroundAction.new_mover( owner, last_scene_name, _key, last_scene_path ) )


func add_mover( _name : String, _key : Key, _scene_path : String ):
	container.push_back( PlayGroundAction.new_mover( owner, _name, _key, _scene_path ) )


func add_action( _name : String, _key : Key, _functor : Callable ):
	container.push_back( PlayGroundAction.new_action( _name, _key, _functor ) )


func add_split():
	container.push_back( PlayGroundAction.new_split() )


func add_lf():
	container.push_back( PlayGroundAction.new_lf() )


func get_keycode_string( key : Key )->String:
	if Key.KEY_ESCAPE == key:
		return "ESC"
	else:
		return OS.get_keycode_string( key )


func build_summary()->String:
	var ret : String = ( "+ " + name + "\n" )
	
	var split_string : String
	
	for i in container:
		if Key.KEY_NONE != i.key:
			ret += ( "[" + get_keycode_string( i.key ) + "] " + i.name + "\n" )
		else:
			if "=" == i.name:
				if split_string.is_empty():
					var split_length = 0
					# scene name
					if name.length() > split_length:
							split_length = name.length() + 2 # 2 is decoration
					# action name
					for j in container:
						if j.name.length() > split_length:
							split_length = ( get_keycode_string( j.key ).length() + j.name.length() + 3 ) # 3 is decoration
					# build split string
					split_string = ( i.name.repeat( split_length ) + "\n" )
				
				ret += split_string
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
