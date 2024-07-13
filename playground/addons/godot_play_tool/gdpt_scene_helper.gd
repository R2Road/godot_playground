extends Label



############################ Override ############################
func _ready():
	# 한 번 만 위치를 설정한다.
	self.text = " \n " # 높이 할당을 위한 문자열 설정
	self.position.y = get_viewport().size.y - self.get_minimum_size().y


func _process( _delta ):
	self.text = (
		str( get_viewport().size.x ) + " x " + str( get_viewport().size.y )
		+ "\n"
		+ "fps : " + str( Engine.get_frames_per_second() )
	)
