class_name GDPTHelper_Controller extends Node



### Variable #####################################################
var owner_node : Variant

var callback_draw : Callable
var callback_input : Callable
var callback_process : Callable
var callback_ready : Callable



### Override #####################################################
func _draw()->void:
	if callback_draw:
		callback_draw.call( owner_node )

func _input(event: InputEvent) -> void:
	print( "ii" )
	if callback_input:
		callback_input.call( owner_node, event )

func _process(delta: float) -> void:
	if callback_process:
		callback_process.call( owner_node, delta )

func _ready()->void:
	if callback_ready:
		callback_ready.call( owner_node )
