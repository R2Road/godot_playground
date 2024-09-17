extends GDPTScene



############################  Export  ############################



############################ ReadOnly ############################



############################ Variable ############################



############################ Override ############################
func _ready():
	pam.set_name( "PlayGround" )
	pam.add_split()
	pam.add_exit()
	pam.add_lf()
	pam.add_root( basic_root.scene_name(),		Key.KEY_1, 		basic_root.scene_path() )
	pam.add_lf()
	pam.add_root( "Audio",		Key.KEY_Q, 		"res://audio/audio_root.tscn" )
	pam.add_lf()
	pam.add_root( "ETC",		Key.KEY_Z, 		"res://2d/etc/etc_root.tscn" )
	pam.add_split()
	build_summary( eSceneType.ROOT )
	
	#
	# Start Practice
	#
	
	# do something



############################   User   ############################



############################  Signal  ############################
