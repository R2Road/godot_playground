class_name input__set_input_as_handled extends GDPTScene



### Variable #####################################################
var count_normal : int = 0
var count_block : int = 0



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Input : Set Input as Handled"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_message( "[1] Normal" )
	pam.add_message( "[2] Block" )
	pam.add_action( "Count Clear", KEY_3, 
		func()->void:
			count_normal = 0
			count_block = 0
	)
	pam.add_lf()
	pam.add_note( "Z 값이 높은 녀석들 부터 처리된다." )
	build_summary( eSceneType.TEST )
	
	#
	#
	#
	controller_setup( $Normal/L_1, control_func_1_normal )
	controller_setup( $Normal/L_1/L_1_1, control_func_1_normal )
	controller_setup( $Normal/L_1/L_1_1/L_1_1_1, control_func_1_normal )
	controller_setup( $Normal/L_2, control_func_1_normal )
	controller_setup( $Normal/L_3, control_func_1_normal )
	controller_setup( $Normal/L_4, control_func_1_normal )
	
	controller_setup( $Block/L_1, control_func_2_normal )
	controller_setup( $Block/L_1/L_1_1, control_func_2_normal )
	controller_setup( $Block/L_1/L_1_1/L_1_1_1, control_func_2_block )
	controller_setup( $Block/L_2, control_func_2_normal )
	controller_setup( $Block/L_3, control_func_2_normal )
	controller_setup( $Block/L_4, control_func_2_normal )


func _input( event: InputEvent ) -> void:
	var ke : InputEventKey = event as InputEventKey
	if not ke:
		return
	
	if KEY_1 != ke.keycode and KEY_2 != ke.keycode:
		return
	
	if not ke.is_released():
		return
	
	count_normal += 1
	$Keycode.text = str( count_normal ) + " : " + $Keycode.name + " : " + str( ke.keycode)


### Interface ####################################################
func controller_setup( _target_node : Node, _control_func : Callable )->void:
	var script_resource = ResourceLoader.load( "res://addons/godot_play_tool/helper/helper_controller.gd" )
	_target_node.set_script( script_resource )
	
	_target_node.owner_node = _target_node
	_target_node.callback_input = _control_func
	_target_node.set_process_input( true )


func control_func_1_normal( owner_node, event : InputEvent )->void:
	var ke : InputEventKey = event as InputEventKey
	if not ke:
		return
	
	if KEY_1 != ke.keycode:
		return
	
	if not ke.is_released():
		return
	
	count_normal += 1
	owner_node.text = str( count_normal ) + " : " + owner_node.name


func control_func_2_normal( owner_node, event : InputEvent )->void:
	var ke : InputEventKey = event as InputEventKey
	if not ke:
		return
	
	if KEY_2 != ke.keycode:
		return
	
	if not ke.is_released():
		return
	
	count_block += 1
	owner_node.text = str( count_block ) + " : " + owner_node.name

func control_func_2_block( owner_node, event : InputEvent )->void:
	var ke : InputEventKey = event as InputEventKey
	if not ke:
		return
	
	if KEY_2 != ke.keycode:
		return
	
	if not ke.is_released():
		return
	
	count_block += 1
	owner_node.text = str( count_block ) + " : " + owner_node.name + " : Block"
	get_viewport().set_input_as_handled()
