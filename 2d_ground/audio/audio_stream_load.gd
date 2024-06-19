extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Audio : Stream Load" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "play sfx", Key.KEY_1, play )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	var audio_stream_player = AudioStreamPlayer.new()
	audio_stream_player.name = "AudioStreamPlayer_2"
	add_child( audio_stream_player )
	
	var audio_stream : AudioStream = ResourceLoader.load( "res://resources/sound/fx/coin_001.ogg" )
	audio_stream.loop = false
	$AudioStreamPlayer_2.stream = audio_stream
	$AudioStreamPlayer_2.volume_db = -20
	



############################   User   ############################
func play():
	$AudioStreamPlayer_2.play()
