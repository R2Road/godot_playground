extends Node2D



############################ Override ############################
func _process( delta ):
	set_process_input( false )
	get_tree().quit()
