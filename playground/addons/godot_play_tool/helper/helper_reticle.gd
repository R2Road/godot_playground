@tool
extends Node2D



############################  Export  ############################
@export var color_h = Color( 1, 0, 0 ):
	set( value ):
		color_h = value
		self.queue_redraw()
@export var color_v = Color( 0, 0, 1 ):
	set( value ):
		color_v = value
		self.queue_redraw()
@export var length = 50.0:
	set( value ):
		length = value
		self.queue_redraw()
@export var line_width = 1:
	set( value ):
		line_width = value
		self.queue_redraw()



############################ Override ############################
func _init()->void:
	self.set_z_index( RenderingServer.CANVAS_ITEM_Z_MAX )
	#self.z_index = RenderingServer.CANVAS_ITEM_Z_MAX


func _draw()->void:
	draw_line( Vector2( -length * 0.5, 0 ), Vector2( length * 0.5, 0 ), color_h, line_width )
	draw_line( Vector2( 0, -length * 0.5 ), Vector2( 0, length * 0.5 ), color_v, line_width )
