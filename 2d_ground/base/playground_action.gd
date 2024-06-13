class_name PlayGroundAction



############################ Variable ############################
var name : String
var key : Key
var action = func dummy():
	pass



############################   User   ############################
static func new_exit( _owner : Node )->PlayGroundAction:
	var ret = PlayGroundAction.new()
	
	ret.name = "Exit"
	ret.key = Key.KEY_ESCAPE
	ret.action = func ():
		#
		# PlaygroundAction은 call_deferred 로 작동한다.
		# _input을 통해 한 프레임에 여러개의 PlaygroundAction이 deferred queue에 등록 가능 하다.
		# Scene 전환 과정에서 owner node 는 free 된다.
		# 이후에도 deferred queue에 PlaygroundAction이 남아 있을 수 있다.
		# _owner를 검사해서 free 되었다면 action을 수행하지 않는다.
		#
		if null == _owner:
			return
		
		_owner.get_tree().change_scene_to_file( "res://playground_exit.tscn" )
	
	return ret


static func new_mover( _owner : Node, _name : String, _key : Key, _next_scene_path : String )->PlayGroundAction:
	var ret = PlayGroundAction.new()
	
	ret.name = _name
	ret.key = _key
	ret.action = func ():
		#
		# PlaygroundAction은 call_deferred 로 작동한다.
		# _input을 통해 한 프레임에 여러개의 PlaygroundAction이 deferred queue에 등록 가능 하다.
		# Scene 전환 과정에서 owner node 는 free 된다.
		# 이후에도 deferred queue에 PlaygroundAction이 남아 있을 수 있다.
		# _owner를 검사해서 free 되었다면 action을 수행하지 않는다.
		#
		if null == _owner:
			return
		
		#
		# SceneTree 의 change scene 을 사용하지 않고 scene 전환 효과를 만든다.
		#
		var next_scene = ResourceLoader.load( _next_scene_path ).instantiate()
		if next_scene is PlaygroundScene:
			next_scene.pam.set_last_scene( _owner.pam.name, _owner.scene_file_path )
		else:
			print_debug( "warning : is not PlayGroundScene" )
		
		#
		# 현재 Scene의 모든 개체를 제거한다.
		#
		var tree = _owner.get_tree()
		for c in tree.root.get_children():
			c.free()
		
		#
		# Scene 설정
		#
		tree.root.add_child( next_scene )
		# current_scene 을 설정하지 않으면
		# change_scene_to_file 을 이용한 Scene전환 이후
		# 이전 Scene이 남아 있는 경우가 있다.
		tree.set_current_scene( next_scene )
	
	return ret


static func new_action( _owner : Node, _name : String, _key : Key, functor : Callable )->PlayGroundAction:
	var ret = PlayGroundAction.new()
	
	ret.name = _name
	ret.key = _key	
	ret.action = func():
		#
		# PlaygroundAction은 call_deferred 로 작동한다.
		# _input을 통해 한 프레임에 여러개의 PlaygroundAction이 deferred queue에 등록 가능 하다.
		# Scene 전환 과정에서 owner node 는 free 된다.
		# 이후에도 deferred queue에 PlaygroundAction이 남아 있을 수 있다.
		# _owner를 검사해서 free 되었다면 action을 수행하지 않는다.
		#
		if null == _owner:
			return
		
		functor.call()
	
	return ret


static func new_split()->PlayGroundAction:
	var ret = PlayGroundAction.new()
	
	ret.name = "="
	ret.key = Key.KEY_NONE
	
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
