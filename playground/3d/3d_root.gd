extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "3D Root" )
	pam.add_split()
	pam.add_mover( playground_main.scene_name(),		Key.KEY_ESCAPE, playground_main.scene_path() )
	pam.add_lf()
	
	
	
	pam.add_split()
	build_summary( eSceneType.ROOT )
