extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Sprite" )
	pam.add_split()
	pam.add_mover( "Playground",	Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Basic",			Key.KEY_1, "res://gds_sprite/gds_sprite_basic.tscn" )
	build_summary( eSceneType.ROOT )
