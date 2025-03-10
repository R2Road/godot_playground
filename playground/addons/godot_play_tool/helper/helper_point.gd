@tool
class_name GDPTHelper_Point extends Node2D



### Export #######################################################
@export var color = Color( 0, 1, 0 ):
	set( value ):
		color = value
		self.queue_redraw()



### Override #####################################################
func _init()->void:
	self.set_z_index( RenderingServer.CANVAS_ITEM_Z_MAX )
	#self.z_index = RenderingServer.CANVAS_ITEM_Z_MAX


func _draw()->void:
	draw_circle( Vector2( 0, 0 ), 3, color )
