extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Tilemap Root" )
	pam.add_split()
	pam.add_mover( "Playground",		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Demo", Key.KEY_SPACE, "res://tilemap/tilemap_demo_1.tscn" )
	build_summary( eSceneType.ROOT )
