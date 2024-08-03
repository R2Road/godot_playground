extends CanvasLayer



############################ Variable ############################
var play_action_manager : GDPTActionManager = GDPTActionManager.new()



############################ Override ############################
func _init():
	var summary = RichTextLabel.new()
	summary.name = "Summary"
	summary.fit_content = true
	summary.autowrap_mode = TextServer.AutowrapMode.AUTOWRAP_OFF
	add_child( summary )
	
	var fps_label = Label.new()
	fps_label.name = "FPS"
	add_child( fps_label )


func _enter_tree():
	# 한 번 만 위치를 설정한다.
	$FPS.text = " \n " # 높이 할당을 위한 문자열 설정
	$FPS.position.y = get_viewport().size.y - $FPS.get_minimum_size().y


func _process( _delta ):
	$FPS.text = (
		str( get_viewport().size.x ) + " x " + str( get_viewport().size.y )
		+ "\n"
		+ "fps : " + str( Engine.get_frames_per_second() )
	)


func _input( event ):
	play_action_manager.do( event )
