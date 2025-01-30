@tool
extends Node2D



### Export #######################################################
@export var rect : Rect2 = Rect2( 0, 0, 10, 10 ):
	set( value ):
		rect = value
		self.queue_redraw()
@export var color = Color( 0, 1, 0 ):
	set( value ):
		color = value
		self.queue_redraw()
@export var fill = false:
	set( value ):
		fill = value
		self.queue_redraw()
@export var out_line_bold = 1.0:
	set( value ):
		out_line_bold = value
		self.queue_redraw()



### Override #####################################################
func _init()->void:
	self.set_z_index( RenderingServer.CANVAS_ITEM_Z_MAX )
	#self.z_index = RenderingServer.CANVAS_ITEM_Z_MAX


func _draw()->void:
	draw_rect( rect, color, fill, out_line_bold )
