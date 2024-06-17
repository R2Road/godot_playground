extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "ETC Root" )
	pam.add_split()
	pam.add_mover( "Playground",		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Click Sprite",		Key.KEY_1, 		"res://etc/etc_click_sprite.tscn" )
	build_summary( eSceneType.ROOT )
