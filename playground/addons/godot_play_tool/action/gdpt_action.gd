class_name GDPTAction extends RefCounted



### Variable #####################################################
enum eDecoration
{
	Nothing, # Default
	Exit,
	MoveFront,
	MoveBack,
	MoveNext,
	UserDefineAction,
	MessageOnly,
	LineSplit,
}

var message : String
var key : Key
var action : Callable

var decoration : eDecoration = eDecoration.Nothing
var color_4_message = Color.WHITE
var color_4_key = Color.WHITE
var color_4_base = Color.WHITE



### Override #####################################################
func _init(
	  _message : String
	, _key : Key
	, _action : Callable = ( func(): pass )
	
	, _decoration = eDecoration.Nothing
	, _color_4_message = Color.WHITE
	, _color_4_key = Color.GREEN
	, _color_4_base = Color.GRAY
)->void:
	message = _message
	key = _key
	action = _action
	
	decoration = _decoration
	color_4_message = _color_4_message
	color_4_key = _color_4_key
	color_4_base = _color_4_base
