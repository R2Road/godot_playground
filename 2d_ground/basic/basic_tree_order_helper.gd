#
# ref : https://kidscancode.org/godot_recipes/basics/tree_ready_order/
#
class_name GDSBasic_TreeOrder_Helper extends Node



############################ Override ############################
func _init():
	# Note: a Node doesn't have a "name" yet here.
	print( "init : " + name )


func _enter_tree():
	print( "enter tree : " + name )


func _ready():
	print( "ready : " + name )


# This ensures we only print *once* in process().

var test = true
func _process( _delta ):
	if test:
		print( "process : " + name )
		test = false
