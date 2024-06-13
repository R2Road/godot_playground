extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Change Scene" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "Call : change scene with scenetree",	Key.KEY_A, change_scene_with_scenetree )
	pam.add_action( "Call : change scene manually", 		Key.KEY_S, change_scene_manually )
	build_summary( eSceneType.TEST )



############################   User   ############################
func change_scene_with_scenetree():
	#
	# 일반적인 Scene 전환
	#
	get_tree().change_scene_to_file( "res://basic/basic_root.tscn" )


############################   User   ############################
func change_scene_manually():
	#
	# 현재 Main Scene 을 제거하고 새 Scene을 직접 설정한다.
	#
	for c in get_tree().root.get_children():
		# queue free 는 삭제 대기 queue이다.
		# update 단계가 끝나고 나면 삭제 처리를 시작한다.
		# free 보다는 queue_free 가 권장된다.
		# 안전하게 처리 되는 환경을 조성하면 free를 사용해도 된다.
		c.queue_free()
	
	var next_scene = load( "res://basic/basic_root.tscn" ).instantiate()
	get_tree().root.add_child( next_scene )
	get_tree().set_current_scene( next_scene )
