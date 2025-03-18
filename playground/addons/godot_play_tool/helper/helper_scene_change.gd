class_name GDPTHelper_SceneChange extends CanvasLayer



### Summary #####################################################
#
# global 객체로 추가해서 사용하는 것이 아닌 경우.
#
# > 이전 scene의 _exit_tree 가 현재 scene의 _enter_tree보다 늦게 불린다.
# > 해당 함수를 사용 한다면 주의 할 것.
#
# > helper_scene_change 의 작동이 겹치면 fade-in 처리가 완료되지 않는다.
# > scene 전환 과정에서 후 순위 node가 REMOVE_LAST_SCENE_WAIT 상태에서 빠져나오지 못하기 때문이다.
# > 가급적 global로 사용할 것.
#
#################################################################



### Export #######################################################
@export var color_rect_node : ColorRect



### Variable #####################################################
var scene_path : String
var next_scene : Node
var auto_load_count : int = 0

enum eStep
{
	NONE,
	
	FADE_OUT_START,
	FADE_OUT_WAIT,
	
	LOAD,
	REMOVE_LAST_SCENE,
	REMOVE_LAST_SCENE_WAIT,
	CHANGE_SCENE,
	
	FADE_IN_START,
	FADE_IN_WAIT,
	
	END,
}
var current_step : eStep = eStep.NONE
var fade_out_seconds : float = 0.8
var fade_in_seconds : float = 0.8
var delete_when_finished : bool = false



### Override #####################################################
func _init()->void:
	#
	# Global 에 추가해서 쓸 때 사용된다.
	#
	add_to_group( "autoload" )


func _ready()->void:
	set_physics_process( false )


func _physics_process(delta: float) -> void:
	match current_step:
		eStep.FADE_OUT_START:
			var tween : Tween = color_rect_node.create_tween()
			tween.tween_property( color_rect_node, "color:a", 1, fade_out_seconds )
			tween.finished.connect( func()->void: current_step = eStep.LOAD )
			
			current_step = eStep.FADE_OUT_WAIT
		eStep.FADE_OUT_WAIT:
			pass
		
		eStep.LOAD:
			next_scene = ResourceLoader.load( scene_path ).instantiate()
			
			current_step = eStep.REMOVE_LAST_SCENE
		
		eStep.REMOVE_LAST_SCENE:
			remove_last_scene()
			
			#
			# helper_scene_change가 global 객체가 아니라면 eStep.CHANGE_SCENE에 도달하지 못한다.
			# 즉시 scene 변경 처리를 마무리 한다.
			#
			if get_tree().root != get_parent():
				change_scene()
			
			#
			# helper_scene_change의 Z 값을 변경해서 Fade-in 처리를 정상적으로 마무리 한다.
			#
			if get_tree().root == self.get_parent():
				get_tree().root.move_child( self, get_tree().root.get_child_count() )
			
			current_step = eStep.REMOVE_LAST_SCENE_WAIT
		eStep.REMOVE_LAST_SCENE_WAIT:
			if auto_load_count == get_tree().root.get_child_count():
				current_step = eStep.CHANGE_SCENE
		
		eStep.CHANGE_SCENE:
			change_scene()
			
			current_step = eStep.FADE_IN_START
		
		eStep.FADE_IN_START:
			#
			# 알파 값을 1로 바꿔서 Fade-in 처리시 z 값이 제대로 됐는지 확인 가능.
			#
			var tween : Tween = color_rect_node.create_tween()
			tween.tween_property( color_rect_node, "color:a", 0, fade_in_seconds )
			tween.finished.connect( func()->void: current_step = eStep.END )
			
			current_step = eStep.FADE_IN_WAIT
		eStep.FADE_IN_WAIT:
			pass
		
		eStep.END:
			if delete_when_finished:
				queue_free()
			
			set_physics_process( false )
			
			current_step = eStep.NONE
		



### Interface ####################################################
func start( _scene_path : String, _fade_out_seconds : float = 0.8, _fade_in_seconds : float = 0.8, _delete_when_finished : bool = false )->void:
	scene_path = _scene_path
	next_scene = null
	
	auto_load_count = 0
	for c in get_tree().root.get_children():
		if c.is_in_group( "autoload" ):
			auto_load_count += 1
	
	current_step = eStep.FADE_OUT_START
	fade_out_seconds = _fade_out_seconds
	fade_in_seconds = _fade_in_seconds
	delete_when_finished = _delete_when_finished
	
	set_physics_process( true )


func remove_last_scene()->void:
	#
	# 현재 Scene의 Camera Off
	#
	if get_viewport().get_camera_2d():
		get_viewport().get_camera_2d().enabled = false
	if get_viewport().get_camera_3d():
		get_viewport().get_camera_3d().enabled = false
	
	#
	# 현재 Scene의 모든 개체를 제거한다.
	#
	for c in get_tree().root.get_children():
		if not c.is_in_group( "autoload" ):
			c.queue_free()


func change_scene()->void:
	#
	# Scene 설정
	#
	get_tree().root.add_child( next_scene )
	# current_scene 을 설정하지 않으면
	# change_scene_to_file 을 이용한 Scene전환 이후
	# 이전 Scene이 남아 있는 경우가 있다.
	get_tree().set_current_scene( next_scene )
	
	next_scene = null
