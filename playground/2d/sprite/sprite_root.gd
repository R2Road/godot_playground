extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Sprite Root" )
	pam.add_split()
	pam.add_mover( "Playground",	Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Basic",			Key.KEY_1, "res://2d/sprite/sprite2d_basic.tscn" )
	pam.add_mover( "Load Texture",	Key.KEY_2, "res://2d/sprite/sprite2d_load_texture.tscn" )
	pam.add_mover( "Offset",		Key.KEY_3, "res://2d/sprite/sprite2d_offset.tscn" )
	pam.add_mover( "Aliasing",		Key.KEY_4, "res://2d/sprite/sprite2d_aliasing.tscn" )
	pam.add_mover( "Sheet",			Key.KEY_5, "res://2d/sprite/sprite2d_sheet.tscn" )
	pam.add_lf()
	pam.add_mover( "Animation Basic",	Key.KEY_Q, "res://2d/sprite/sprite_animation_basic.tscn" )
	pam.add_mover( "Animation Control",	Key.KEY_W, "res://2d/sprite/sprite_animation_control.tscn" )
	pam.add_mover( "Animation Load : Sprite Textures",	Key.KEY_E, "res://2d/sprite/sprite_animation_load_sprite_textures.tscn" )
	pam.add_mover( "Animation Load : Atlas Texture",	Key.KEY_R, "res://2d/sprite/sprite_animation_load_atlas_texture.tscn" )
	build_summary( eSceneType.ROOT )
