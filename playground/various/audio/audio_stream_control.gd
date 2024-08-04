extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Audio : Stream Control" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "play", Key.KEY_1, play )
	pam.add_action( "stop", Key.KEY_2, stop )
	pam.add_action( "volume : +", Key.KEY_Q, volume_up )
	pam.add_action( "volume : -", Key.KEY_W, volume_down )
	pam.add_action( "loop : o", Key.KEY_A, loop_on )
	pam.add_action( "loop : x", Key.KEY_S, loop_off )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	update_audio_info()



############################   User   ############################
func play():
	$AudioStreamPlayer.play()
func stop():
	$AudioStreamPlayer.stop()

func volume_up():
	$AudioStreamPlayer.volume_db += 1
	update_audio_info()
func volume_down():
	$AudioStreamPlayer.volume_db -= 1
	update_audio_info()

func loop_on():
	$AudioStreamPlayer.stream.loop = true
	update_audio_info()
func loop_off():
	$AudioStreamPlayer.stream.loop = false
	update_audio_info()

func update_audio_info():
	var s : String = ""
	
	s += "volume db : " + str( $AudioStreamPlayer.volume_db )
	s += "\n"
	s += "loop : " + str( $AudioStreamPlayer.stream.loop )
	
	$Label.text = s
	$Label.set_position(
		( get_viewport().size * 0.5 )
		- ( $Label.get_minimum_size() * $Label.get_scale() * 0.5 )
	)
