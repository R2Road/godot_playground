@tool
extends Node2D



############################ Variable ############################
@export var offset : Vector2 = Vector2( 0, 0 ):
	set( value ):
		offset = value
		self.queue_redraw()
@export var color = Color( 0, 1, 0 ):
	set( value ):
		color = value
		self.queue_redraw()
@export var radius : float = 1:
	set( value ):
		radius = value
		self.queue_redraw()
@export var fill = false:
	set( value ):
		fill = value
		self.queue_redraw()



############################ Override ############################
func _init():
	self.set_z_index( RenderingServer.CANVAS_ITEM_Z_MAX )
	#self.z_index = RenderingServer.CANVAS_ITEM_Z_MAX


func _draw():
	if fill:
		draw_circle( offset, radius, color )
	else:
		draw_arc( offset, radius, 0, TAU, 1000, color )
