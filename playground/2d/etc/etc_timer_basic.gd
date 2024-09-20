class_name timer_basic extends GDPTScene



############################ Variable ############################
var timeout_count_1 : int = 0
var timeout_count_2 : int = 0



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Timer Basic"



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	var timer = Timer.new()
	timer.name = "Timer_2"
	add_child( timer )
	
	$Timer_2.wait_time = 1
	$Timer_2.timeout.connect( _on_timer_timeout_2 )
	$Timer_2.start()
	
	show_timeout_info()



############################  Signal  ############################
func _on_timer_timeout():
	timeout_count_1 += 1
	show_timeout_info()

func _on_timer_timeout_2():
	timeout_count_2 += 1
	show_timeout_info()
	
	$Timer_2.start()



############################   User   ############################
func show_timeout_info():
	var s : String = ""
	s += "time out count 1 : " + str( timeout_count_1 )
	s += "\n"
	s += "time out count 2 : " + str( timeout_count_2 )
	
	$Label.text = s
	$Label.set_position(
		( get_viewport().size * 0.5 )
		- ( $Label.get_minimum_size() * $Label.get_scale() * 0.5 )
	)
