extends Node



############################ Variable ############################
var on_assert = true



############################ Override ############################
func _enter_tree():
	# 호출 된다.
	print( "PGG : Enter Tree" )
func _exit_tree():
	# 호출 안된다. ( 왜? )
	print( "PGG : Exit Tree" )



############################   User   ############################
func _assert( flag ):
	if on_assert:
		assert( flag )
