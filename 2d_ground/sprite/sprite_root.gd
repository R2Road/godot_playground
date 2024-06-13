extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Sprite Root" )
	pam.add_split()
	pam.add_mover( "Playground",	Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Basic",			Key.KEY_1, "res://sprite/sprite_basic.tscn" )
	pam.add_mover( "Load Texture",	Key.KEY_2, "res://sprite/sprite_load_texture.tscn" )
	pam.add_mover( "Offset",		Key.KEY_3, "res://sprite/sprite_offset.tscn" )
	pam.add_mover( "Aliasing",		Key.KEY_4, "res://sprite/sprite_aliasing.tscn" )
	pam.add_lf()
	pam.add_mover( "Animation",			Key.KEY_Q, "res://sprite/sprite_animation.tscn" )
	pam.add_mover( "Animation Control",	Key.KEY_W, "res://sprite/sprite_animation_control.tscn" )
	build_summary( eSceneType.ROOT )
