extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Animation Load : Atlas Texture" )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	$AnimatedSprite2D_1.set_position( get_viewport().size * 0.25 )
	$AnimatedSprite2D_1.sprite_frames.set_animation_loop( "ani_1", true )
	$AnimatedSprite2D_1.play( "ani_1" )
	
	$AnimatedSprite2D_2.set_position( get_viewport().size * 0.5 )
	$AnimatedSprite2D_2.sprite_frames = load( "res://resources/sprite/actor001/sprite2d_animation_actor001_atlas_texture.tres" )
	$AnimatedSprite2D_2.sprite_frames.set_animation_loop( "ani_2", true )
	$AnimatedSprite2D_2.play( "ani_2" )
	
	# Build Sprite Animation with Atlas Texture
	$AnimatedSprite2D_3.set_position( get_viewport().size * 0.75 )
	var sprite_frames = SpriteFrames.new()
	sprite_frames.add_animation( "ani_1" )
	
	var atlas_texture = AtlasTexture.new()
	atlas_texture.set_atlas( load( "res://resources/sprite/actor001/actor001_sheet.png" ) )
	
	atlas_texture.set_region( Rect2( 0, 0, 24, 44 ) )
	sprite_frames.add_frame( "ani_1", atlas_texture.duplicate() )
	
	atlas_texture.set_region( Rect2( 24, 0, 24, 44 ) )
	sprite_frames.add_frame( "ani_1", atlas_texture.duplicate() )
	
	atlas_texture.set_region( Rect2( 48, 0, 24, 44 ) )
	sprite_frames.add_frame( "ani_1", atlas_texture.duplicate() )
	
	atlas_texture.set_region( Rect2( 72, 0, 24, 44 ) )
	sprite_frames.add_frame( "ani_1", atlas_texture )
	
	sprite_frames.set_animation_speed( "ani_1", 10 )
	sprite_frames.set_animation_loop( "ani_1", true )
	
	$AnimatedSprite2D_3.sprite_frames = sprite_frames
	$AnimatedSprite2D_3.play( "ani_1" )
	
