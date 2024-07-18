extends Node2D



############################ Variable ############################
@export var color_h = Color( 1, 0, 0 )
@export var color_v = Color( 0, 0, 1 )
@export var length = 50.0
@export var line_width = 1



############################ Override ############################
func _init():
	self.set_z_index( RenderingServer.CANVAS_ITEM_Z_MAX )
	#self.z_index = RenderingServer.CANVAS_ITEM_Z_MAX


func _draw():
	draw_line( Vector2( -length * 0.5, 0 ), Vector2( length * 0.5, 0 ), color_h, line_width )
	draw_line( Vector2( 0, -length * 0.5 ), Vector2( 0, length * 0.5 ), color_v, line_width )
