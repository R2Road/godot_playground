extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Sprite" )
	pam.add_split()
	pam.add_mover( "Playground",		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	build_summary( eSceneType.ROOT )
