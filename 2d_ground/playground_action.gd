class_name PlayGroundAction



############################ Variable ############################
var owner : Node
var name : String
var key : Key
var action = func dummy():
	pass



############################   User   ############################
static func new_mover( _name : String, _key : Key, _scene_path : String )->PlayGroundAction:
	var ret = PlayGroundAction.new()
	
	ret.name = _name
	ret.key = _key	
	ret.action = func ():
		ret.owner.get_tree().change_scene_to_file( _scene_path )
	
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
