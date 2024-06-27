extends Node



############################ Variable ############################
var on_assert = true



############################   User   ############################
func _assert( flag ):
	if on_assert:
		assert( flag )
