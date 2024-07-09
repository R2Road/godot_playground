extends PlaygroundScene



############################ Variable ############################
@export var audio_list : Array[AudioStream]



############################ Override ############################
func _ready():
	pam.set_name( "Audio : Stream Array" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "play sfx : 1", Key.KEY_1, ( func(): play( 0 ) ) )
	pam.add_action( "play sfx : 2", Key.KEY_2, ( func(): play( 1 ) ) )
	pam.add_action( "play sfx : 3", Key.KEY_3, ( func(): play( 2 ) ) )
	pam.add_action( "play sfx : 4", Key.KEY_4, ( func(): play( 3 ) ) )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	for r in audio_list:
		r.loop = false
	
	$Label.set_position(
		( get_viewport().size * 0.5 )
		- ( $Label.get_minimum_size() * $Label.get_scale() * 0.5 )
	)



############################   User   ############################
func play( audio_index : int ):
	$AudioStreamPlayer.stream = audio_list[audio_index]
	$AudioStreamPlayer.play()
	update_audio_info( audio_index )

func update_audio_info( audio_index : int ):
	var s : String = ( "+ play\n" + audio_list[audio_index].resource_path )
	
	$Label.text = s
	$Label.set_position(
		( get_viewport().size * 0.5 )
		- ( $Label.get_minimum_size() * $Label.get_scale() * 0.5 )
	)
