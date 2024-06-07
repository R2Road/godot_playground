#
# ref : https://kidscancode.org/godot_recipes/basics/tree_ready_order/
#
class_name GDSBasic_TreeOrder_Helper extends Node



############################ Override ############################
func _init():
	# Note: a Node doesn't have a "name" yet here.
	print( name + " init" )


func _enter_tree():
	print( name + " enter tree" )


func _ready():
	print( name + " ready" )


# This ensures we only print *once* in process().

var test = true
func _process( _delta ):
	if test:
		print( name + " process" )
		test = false
