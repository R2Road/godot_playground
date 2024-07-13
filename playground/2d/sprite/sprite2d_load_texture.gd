extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Sprite2D : Load Texture" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	var loaded_texture = ResourceLoader.load( "res://resources/sprite/actor001/actor001_idle_01.png" )
	
	var sprite_node = Sprite2D.new()
	sprite_node.texture = loaded_texture
	sprite_node.position = ( get_viewport().size * 0.5 )
	sprite_node.scale = Vector2( 4, 4 )
	add_child( sprite_node )
