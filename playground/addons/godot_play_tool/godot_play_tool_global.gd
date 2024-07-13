extends Node



############################ Variable ############################
var on_assert = true



############################ Override ############################
func _enter_tree():
	# 호출 된다.
	print( "GDPT : Enter Tree" )
func _exit_tree():
	# 호출 안된다. ( 왜? )
	print( "GDPT : Exit Tree" )



############################   User   ############################
func _assert( flag ):
	if on_assert:
		assert( flag )
