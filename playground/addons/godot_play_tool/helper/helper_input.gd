@tool
class_name GDPTHelper_Input extends Node2D



### Variable #####################################################
var input_info_container : Dictionary = {}

enum eState
{
	NONE,
	PUSH,
	PRESSED,
	RELEASE,
}

class KeyInfo extends RefCounted:
	var action : Callable
	
	var target_state : eState = eState.NONE
	var current_state : eState = eState.NONE
	var stack : int = 0
	
	
	static func create( _target_state : eState, _action : Callable )->KeyInfo:
		var ret = KeyInfo.new()
		ret.target_state = _target_state
		ret.action = _action
		return ret
	
	func update()->void:
		match current_state:
			eState.PUSH:
				if 1 == stack:
					change_state( eState.PRESSED )
				else:
					stack += 1
			eState.RELEASE:
				if 1 == stack:
					change_state( eState.NONE )
				else:
					stack += 1
	
	func press()->void:
		match current_state:
			eState.NONE:
				change_state( eState.PUSH )
			eState.RELEASE:
				change_state( eState.PUSH )
	
	func release()->void:
		change_state( eState.RELEASE )
	
	func change_state( _state : eState )->void:
		current_state = _state
		stack = 0
		
		# for test
		#print( str( current_state ) )
	
	func get_state()->eState:
		return current_state
	
	func do()->void:
		if target_state == current_state:
			action.call()



### Override #####################################################
func _physics_process(delta: float) -> void:
	for i in input_info_container:
		input_info_container[i].update()
		input_info_container[i].do()
	
	# for test
	#print( "---------------------------------" )



func _unhandled_input( event: InputEvent ) -> void:
	if not ( event is InputEventKey ):
		return
	
	var ke : InputEventKey = event as InputEventKey
	
	var info : KeyInfo = input_info_container.get( ke.keycode )
	if not info:
		return
	
	if ke.is_pressed():
		info.press()
	else:
		info.release()



### Interface ####################################################
func add( _key : Key, _target_state : GDPTHelper_Input.eState, _action : Callable )->void:
	for i in input_info_container:
		if _key == i:
			if _target_state == input_info_container[i].target_state:
				print( "Already Added : Key - %s, State - %s" % [OS.get_keycode_string( _key ), str( _target_state)] )
				return
	
	input_info_container[_key] = KeyInfo.create( _target_state, _action )
