extends Node



############################ Override ############################
func _process( _delta : float )->void:
	set_process_input( false )
	get_tree().quit()
