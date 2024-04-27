extends Node

var test_sprite_node = preload( "res://gds_step_03_sprite/TestSpriteNode.tscn" )

func _ready():
	var tsn = test_sprite_node.instantiate()
	tsn.position = Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.5 )
	add_child( tsn )
