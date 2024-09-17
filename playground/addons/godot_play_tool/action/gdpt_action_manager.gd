class_name GDPTActionManager extends RefCounted



############################ Variable ############################
var owner : Node
var name : String
var container : Array

var last_scene_path : String
var last_scene_name : String



############################   User   ############################
func set_name( _name : String ):
	name = _name


func set_last_scene( _last_scene_name : String, _last_scene_path : String ):
	last_scene_name = _last_scene_name
	last_scene_path = _last_scene_path


func add_exit():
	container.push_back( GDPTAction.new(
		"Exit"
		, Key.KEY_ESCAPE
		, ( func ():
			#
			# Scene 전환이 이미 일어났는지 확인
			# GDPTAction은 call_deferred 로 작동한다.
			# 키를 동시에 2개 이상 누른 경우
			# 한 프레임에 여러번의 Scene 전환 가능
			#
			if owner == owner.get_tree().current_scene:
				owner.get_tree().change_scene_to_file( "res://addons/godot_play_tool/scene/gdpt_scene_exit.tscn" ) )
		, GDPTAction.eDecoration.Exit
		, Color.WEB_GRAY
		, Color.SEA_GREEN
	) )


func add_back( _key : Key ):
	container.push_back( GDPTAction.new(
		  last_scene_name
		, _key
		, build_mover( last_scene_path )
		, GDPTAction.eDecoration.MoveBack
		, Color.DARK_GRAY
		, Color.FOREST_GREEN
	) )

# add mover 와 같지만 장식의 차이만 달리 준다.
# 종종 add_back을 부르지 않고 직접 scene을 지정해 같은 기능을 제공할 필요가 있다.
# 그 상황을 위한 것이다.
func add_front( _message : String, _key : Key, _scene_path : String ):
	container.push_back( GDPTAction.new(
		  _message
		, _key
		, build_mover( _scene_path )
		, GDPTAction.eDecoration.MoveFront
		, Color.DARK_GRAY
		, Color.FOREST_GREEN
	) )

func add_root( _message : String, _key : Key, _scene_path : String ):
	container.push_back( GDPTAction.new(
		  _message
		, _key
		, build_mover( _scene_path )
		, GDPTAction.eDecoration.MoveNext
		, Color.SKY_BLUE
	) )

func add_mover( _message : String, _key : Key, _scene_path : String ):
	container.push_back( GDPTAction.new(
		  _message
		, _key
		, build_mover( _scene_path )
		, GDPTAction.eDecoration.MoveNext
	) )


func build_mover( _scene_path : String )->Callable:
	GDPT._assert( not _scene_path.is_empty() )
	
	if _scene_path.is_empty():
		return Callable()
	
	return ( func ():
			#
			# Scene 전환이 이미 일어났는지 확인
			# GDPTAction은 call_deferred 로 작동한다.
			# 키를 동시에 2개 이상 누른 경우
			# 한 프레임에 여러번의 Scene 전환 가능
			#
			if owner != owner.get_tree().current_scene:
				return
			
			#
			# 현재 Scene의 Camera Off
			#
			if owner.get_viewport().get_camera_2d():
				owner.get_viewport().get_camera_2d().enabled = false
			if owner.get_viewport().get_camera_3d():
				owner.get_viewport().get_camera_3d().enabled = false
			
			#
			# 현재 Scene의 모든 개체를 제거한다.
			#
			var tree = owner.get_tree()
			for c in tree.root.get_children():
				if not c.is_in_group( "autoload" ):
					c.queue_free()
			
			#
			# SceneTree 의 change scene 을 사용하지 않고 scene 전환 효과를 만든다.
			#
			var next_scene = ResourceLoader.load( _scene_path ).instantiate()
			if ( next_scene is GDPTScene ) and ( owner is GDPTScene ):
				next_scene.pam.set_last_scene( owner.pam.name, owner.scene_file_path )
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
	)


func add_action( _message : String, _key : Key, _functor : Callable ):
	container.push_back( GDPTAction.new(
		_message
		, _key
		, _functor
		, GDPTAction.eDecoration.UserDefineAction
	) )


func add_split():
	container.push_back( GDPTAction.new(
		"="
		, Key.KEY_NONE
		, ( func(): pass )
		, GDPTAction.eDecoration.LineSplit
	) )


func add_message( _message : String ):
	container.push_back( GDPTAction.new(
		( _message + "\n" )
		, Key.KEY_NONE
	) )


func add_subject( _message : String ):
	container.push_back( GDPTAction.new(
		( "+ " + _message + "\n" )
		, Key.KEY_NONE
		, ( func(): pass )
		, GDPTAction.eDecoration.MessageOnly
		, Color.YELLOW
	) )
func add_note( _message : String ):
	container.push_back( GDPTAction.new(
		( "    > " + _message + "\n" )
		, Key.KEY_NONE
		, ( func(): pass )
		, GDPTAction.eDecoration.MessageOnly
		, Color.DARK_ORANGE
	) )


func add_lf():
	container.push_back( GDPTAction.new(
		"\n"
		, Key.KEY_NONE
	) )


func add_lf2():
	container.push_back( GDPTAction.new(
		"\n\n"
		, Key.KEY_NONE
	) )


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
	
	# calculate length of split string : with scene name
	if not name.is_empty():
		split_length = name.length() + 2 # 2 is decoration ( '#', ' ' )
	
	# calculate length of split string : with action name
	for j in container:
		var new_split_length = ( get_keycode_string( j.key ).length() + j.message.length() + 3 ) # 3 is decoration( '[', ']', ' ' )
		if new_split_length > split_length:
			split_length = new_split_length
	
	split_string = ( ( "=" ).repeat( split_length ) + "\n" )
	
	
	#
	# build summary
	#
	var ret : String
	if not name.is_empty():
		ret = ( "# " + name + "\n" )
	
	var fixed_message : String
	for i : GDPTAction in container:
		
		fixed_message = ""
		
		# 특별한 글자 꾸미기 처리
		match i.decoration:
			GDPTAction.eDecoration.MoveFront:
				fixed_message = ( "[color=dark_goldenrod]<<[/color] " + i.message )
			GDPTAction.eDecoration.MoveBack:
				fixed_message = ( "[color=dark_goldenrod]<<[/color] " + i.message )
			GDPTAction.eDecoration.MoveNext:
				fixed_message = ( "[color=gold]>>[/color] " + i.message )
			GDPTAction.eDecoration.MessageOnly:
				fixed_message += "[color=#" + str( i.color_4_message.to_html() ) + "]"
				fixed_message += ( i.message )
				fixed_message += "[/color]"
			GDPTAction.eDecoration.LineSplit:
				fixed_message += "[color=dimgray]"
				fixed_message += split_string
				fixed_message += "[/color]"
			GDPTAction.eDecoration.Exit, GDPTAction.eDecoration.UserDefineAction, GDPTAction.eDecoration.Nothing:
				fixed_message = i.message
			_:
				GDPT._assert_f()
		
		# 공용 메세지 꾸미기.
		if ( GDPTAction.eDecoration.Nothing == i.decoration
		  or GDPTAction.eDecoration.MessageOnly == i.decoration
		  or GDPTAction.eDecoration.LineSplit == i.decoration ):
			ret += fixed_message
		else:
			ret += (
				"[color=#" + str( i.color_4_base.to_html() ) + "]"
				
					+ "["
						+ "[color=#" + str( i.color_4_key.to_html() ) + "]"
						+ get_keycode_string( i.key )
						+ "[/color]"
					+ "] "
					
					+ "[color=#" + str( i.color_4_message.to_html() ) + "]"
					+ fixed_message
					+ "[/color]"
					
				+ "[/color]"
				+ "\n"
			)
	
	return ret


func get_action( keycode : Key )->GDPTAction:
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
