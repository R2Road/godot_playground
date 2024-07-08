extends Node2D



############################ Override ############################
func _ready():
	var target_position = get_viewport().size * 0.5
	get_parent().position = get_parent().get_parent().to_local( target_position )
