class_name PlayGroundAction



############################ Variable ############################
var name : String
var key : Key
var action = func dummy():
	pass



############################   User   ############################
static func new_exit( _owner : Node, _name : String, _key : Key, _scene_path : String )->PlayGroundAction:
	var ret = PlayGroundAction.new()
	
	ret.name = _name
	ret.key = _key	
	ret.action = func ():
		_owner.get_tree().change_scene_to_file( _scene_path )
	
	return ret


static func new_mover( _owner : Node, _name : String, _key : Key, _next_scene_path : String )->PlayGroundAction:
	var ret = PlayGroundAction.new()
	
	ret.name = _name
	ret.key = _key	
	ret.action = func ():
		# 현재 Scene의 모든 개체를 제거한다.
		for c in _owner.get_tree().root.get_children():
			c.queue_free()
		
		# SceneTree 의 change scene 을 사용하지 않고 scene 전환 효과를 만든다.
		var next_scene = ResourceLoader.load( _next_scene_path ).instantiate()
		_owner.get_tree().root.add_child( next_scene )
	
	return ret


static func new_action( _name : String, _key : Key, functor : Callable )->PlayGroundAction:
	var ret = PlayGroundAction.new()
	
	ret.name = _name
	ret.key = _key	
	ret.action = functor
	
	return ret


static func new_lf()->PlayGroundAction:
	var ret = PlayGroundAction.new()
	
	ret.name = "\n"
	ret.key = Key.KEY_NONE
	
	return ret


static func new_lf2()->PlayGroundAction:
	var ret = PlayGroundAction.new()
	
	ret.name = "\n\n"
	ret.key = Key.KEY_NONE
	
	return ret
