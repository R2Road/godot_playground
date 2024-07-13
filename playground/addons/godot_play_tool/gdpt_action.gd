class_name GDPTAction extends RefCounted



############################ Variable ############################
var name : String
var key : Key
var action = func dummy():
	pass



############################   User   ############################
static func new_exit( _owner : Node )->GDPTAction:
	var ret = GDPTAction.new()
	
	ret.name = "Exit"
	ret.key = Key.KEY_ESCAPE
	ret.action = func ():
		#
		# Scene 전환이 이미 일어났는지 확인
		# GDPTAction은 call_deferred 로 작동한다.
		# 키를 동시에 2개 이상 누른 경우
		# 한 프레임에 여러번의 Scene 전환 가능
		#
		if _owner != _owner.get_tree().current_scene:
			return
		
		_owner.get_tree().change_scene_to_file( "res://addons/godot_play_tool/gdpt_exit_scene.tscn" )
	
	return ret


static func new_mover( _owner : Node, _name : String, _key : Key, _next_scene_path : String )->GDPTAction:
	var ret = GDPTAction.new()
	
	ret.name = _name
	ret.key = _key
	ret.action = func ():
		#
		# Scene 전환이 이미 일어났는지 확인
		# GDPTAction은 call_deferred 로 작동한다.
		# 키를 동시에 2개 이상 누른 경우
		# 한 프레임에 여러번의 Scene 전환 가능
		#
		if _owner != _owner.get_tree().current_scene:
			return
		
		#
		# 현재 Scene의 모든 개체를 제거한다.
		#
		var tree = _owner.get_tree()
		for c in tree.root.get_children():
			if "GDPT" != c.name:
				c.queue_free()
		
		#
		# SceneTree 의 change scene 을 사용하지 않고 scene 전환 효과를 만든다.
		#
		var next_scene = ResourceLoader.load( _next_scene_path ).instantiate()
		if next_scene is GDPTScene:
			next_scene.pam.set_last_scene( _owner.pam.name, _owner.scene_file_path )
		else:
			print_debug( "warning : is not GDPTScene" )
		
		#
		# Scene 설정
		#
		tree.root.add_child( next_scene )
		# current_scene 을 설정하지 않으면
		# change_scene_to_file 을 이용한 Scene전환 이후
		# 이전 Scene이 남아 있는 경우가 있다.
		tree.set_current_scene( next_scene )
		
		# 같은 instance id 가 1번 이상 출력되면
		# 한 프레임에 scene 전환이 여러번 수행된 것이다.
		# print( "Last Scene Instance ID : " + str( _owner.get_instance_id() ) )
	
	return ret


static func new_action( _name : String, _key : Key, _functor : Callable )->GDPTAction:
	var ret = GDPTAction.new()
	
	ret.name = _name
	ret.key = _key	
	ret.action = _functor
	
	return ret


static func new_message( _message : String )->GDPTAction:
	var ret = GDPTAction.new()
	
	ret.name = ( _message + "\n" )
	ret.key = Key.KEY_NONE
	
	return ret


static func new_split()->GDPTAction:
	var ret = GDPTAction.new()
	
	ret.name = "="
	ret.key = Key.KEY_NONE
	
	return ret


static func new_lf()->GDPTAction:
	var ret = GDPTAction.new()
	
	ret.name = "\n"
	ret.key = Key.KEY_NONE
	
	return ret


static func new_lf2()->GDPTAction:
	var ret = GDPTAction.new()
	
	ret.name = "\n\n"
	ret.key = Key.KEY_NONE
	
	return ret
