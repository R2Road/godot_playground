@tool
extends EditorPlugin


func _enter_tree():
	#
	# Editor가 열리는 과정에 로드 된다.
	# Script를 수정해도 바로 반영되지 않는다.
	# Editor 닫고 다시 열어라.
	#
	# add_autoload_singleton 함수는 Project 의 설정을 바꾼다.
	#
	# Singleton의 이름을 바꿨다면 이전 이름이 Project Setting에 남아 있을 수 있다.
	# "Project Setting > Auto Load" 에서 확인해라.
	#
	add_autoload_singleton( 
		"PGG"
		, "res://addons/godot_play_tool/godot_play_tool_global.gd"
	)


func _exit_tree():
	remove_autoload_singleton( "PGG" )
