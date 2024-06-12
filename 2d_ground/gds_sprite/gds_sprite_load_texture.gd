extends Node

func _ready():
	var sprite_resource_actor0001_idle_01 = load( "res://resources/sprite/actor001/actor001_idle_01.png" )
	
	var sprite_node = Sprite2D.new()
	sprite_node.texture = sprite_resource_actor0001_idle_01
	sprite_node.position = Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.5 )
	sprite_node.scale = Vector2( 4, 4 )
	#sprite_node.scale.x = 4
	#sprite_node.scale.y = 4
	
	add_child( sprite_node )
