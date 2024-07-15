extends CanvasLayer



############################ Override ############################
func _init():
	var label = Label.new()
	label.name = "Summary"
	add_child( label )
	
	var fps_label = Label.new()
	fps_label.name = "FPS"
	add_child( fps_label )


func _ready():
	# 한 번 만 위치를 설정한다.
	$FPS.text = " \n " # 높이 할당을 위한 문자열 설정
	$FPS.position.y = get_viewport().size.y - $FPS.get_minimum_size().y


func _process( _delta ):
	$FPS.text = (
		str( get_viewport().size.x ) + " x " + str( get_viewport().size.y )
		+ "\n"
		+ "fps : " + str( Engine.get_frames_per_second() )
	)
