@tool
extends Node2D



############################ Variable ############################
@export var color = Color( 0, 1, 0 ):
	set( value ):
		color = value
		self.queue_redraw()
@export var point_start = Vector2.ZERO:
	set( value ):
		point_start = value
		self.queue_redraw()
@export var point_end = Vector2( 0, 10 ):
	set( value ):
		point_end = value
		self.queue_redraw()
@export var line_width = 1:
	set( value ):
		line_width = value
		self.queue_redraw()



############################ Override ############################
func _init():
	self.set_z_index( RenderingServer.CANVAS_ITEM_Z_MAX )
	#self.z_index = RenderingServer.CANVAS_ITEM_Z_MAX


func _draw():
	draw_line( point_start, point_end, color, line_width )
