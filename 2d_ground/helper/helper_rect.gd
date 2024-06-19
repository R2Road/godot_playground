extends Node2D



@export var rect : Rect2 = Rect2( 0, 0, 10, 10 )
@export var color = Color( 0, 1, 0 )
@export var fill = true
@export var out_line_bold = 1.0

############################ Override ############################
func _init():
	self.set_z_index( RenderingServer.CANVAS_ITEM_Z_MAX )
	#self.z_index = RenderingServer.CANVAS_ITEM_Z_MAX


func _draw():
	draw_rect( rect, color, fill, out_line_bold )
