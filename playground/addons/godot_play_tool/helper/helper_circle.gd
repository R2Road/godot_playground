@tool
extends Node2D



############################ Variable ############################
@export var offset : Vector2 = Vector2( 0, 0 )
@export var color = Color( 0, 1, 0 )
@export var radius : float = 1
@export var fill = false



############################ Override ############################
func _init():
	self.set_z_index( RenderingServer.CANVAS_ITEM_Z_MAX )
	#self.z_index = RenderingServer.CANVAS_ITEM_Z_MAX


func _draw():
	if fill:
		draw_circle( offset, radius, color )
	else:
		draw_arc( offset, radius, 0, TAU, 1000, color )
