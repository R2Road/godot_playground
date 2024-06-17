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


func set_last_scene( _last_scene_name : String, _last_scene_path : String ):
	last_scene_name = _last_scene_name
	last_scene_path = _last_scene_path


func add_exit():
	container.push_back( PlayGroundAction.new_exit( owner ) )


func add_back( _key : Key ):
	add_mover( last_scene_name, _key, last_scene_path )


func add_mover( _name : String, _key : Key, _scene_path : String ):
	assert( not _scene_path.is_empty() )
	if _scene_path.is_empty():
		return
		
	container.push_back( PlayGroundAction.new_mover( owner, _name, _key, _scene_path ) )


func add_action( _name : String, _key : Key, _functor : Callable ):
	container.push_back( PlayGroundAction.new_action( _name, _key, _functor ) )


func add_split():
	container.push_back( PlayGroundAction.new_split() )


func add_message( _message : String ):
	container.push_back( PlayGroundAction.new_message( _message ) )


func add_lf():
	container.push_back( PlayGroundAction.new_lf() )


func get_keycode_string( key : Key )->String:
	if Key.KEY_ESCAPE == key:
		return "ESC"
	else:
		return OS.get_keycode_string( key )


func build_summary()->String:
	#
	# build split string
	#
	var split_string : String
	var split_length = 0
	
	# scene name
	split_length = name.length() + 2 # 2 is decoration ( '#', ' ' )
	
	# action name
	for j in container:
		var new_split_length = ( get_keycode_string( j.key ).length() + j.name.length() + 3 ) # 3 is decoration( '[', ']', ' ' )
		if new_split_length > split_length:
			split_length = new_split_length
	
	split_string = ( ( "=" ).repeat( split_length ) + "\n" )
	
	
	#
	# build summary
	#
	var ret : String = ( "# " + name + "\n" )
	
	for i in container:
		if Key.KEY_NONE != i.key:
			ret += ( "[" + get_keycode_string( i.key ) + "] " + i.name + "\n" )
		else:
			if "=" == i.name:
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
