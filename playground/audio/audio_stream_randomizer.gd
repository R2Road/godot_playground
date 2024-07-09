extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Audio : Stream Randomizer" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "play sfx : random", Key.KEY_1, play_random )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	for i in $AudioStreamPlayer.stream.streams_count:
		$AudioStreamPlayer.stream.get_stream( i ).loop = false
	
	show_audio_info()



############################   User   ############################
func play_random():
	$AudioStreamPlayer.play()

func show_audio_info():
	var s : String = ""
	s += $AudioStreamPlayer.stream.resource_path
	s += "\n\n"
	s += "+ play list"
	s += "\n\n"
	
	for i in $AudioStreamPlayer.stream.streams_count:
		s += str( i )
		s += " : "
		s += $AudioStreamPlayer.stream.get_stream( i ).resource_path
		s += "\n"
	
	$Label.text = s
	$Label.set_position(
		( get_viewport().size * 0.5 )
		- ( $Label.get_minimum_size() * $Label.get_scale() * 0.5 )
	)
