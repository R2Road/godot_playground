extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Sprite" )
	pam.add_split()
	pam.add_mover( "Playground",	Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Basic",			Key.KEY_1, "res://sprite/sprite_basic.tscn" )
	pam.add_mover( "Load Texture",	Key.KEY_2, "res://sprite/sprite_load_texture.tscn" )
	build_summary( eSceneType.ROOT )
