extends Node2D



############################ Override ############################
func _ready():
	var target_position = get_viewport().size * 0.5
	
	if get_parent() is Control:
		get_parent().position = get_parent().get_parent().to_local(
			target_position
			 - ( get_parent().size * get_parent().scale * 0.5 )
		)
	else:
		get_parent().position = get_parent().get_parent().to_local( target_position )
