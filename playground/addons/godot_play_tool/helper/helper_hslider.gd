@tool
class_name GDPTHelper_HSlider extends Control



### Export #######################################################
@export var hslider : HSlider
@export var value_label : Label
@export var title_label : Label
@export var title_text : String:
	set( value ):
		if title_label:
			title_label.set_text( value )
	get():
		if title_label:
			return title_label.text
		else:
			return ""

@export var min_value : float:
	set( _value ):
		if hslider:
			hslider.min_value = _value
	get():
		if hslider:
			return hslider.min_value
		else:
			return 0

@export var max_value : float:
	set( _value ):
		if hslider:
			hslider.max_value = _value
	get():
		if hslider:
			return hslider.max_value
		else:
			return 0

@export var step : float:
	set( _value ):
		if hslider:
			hslider.step = _value
	get():
		if hslider:
			return hslider.step
		else:
			return 0

@export var value : float:
	set( _value ):
		if hslider:
			hslider.value = _value
		if value_label:
			value_label.text = str( _value )
	get():
		if hslider:
			return hslider.value
		else:
			return 0

signal value_changed



### Interface ####################################################
func set_title_label( _text : String )->void:
	title_label.text = _text

func set_value_no_signal( _value : float )->void:
	hslider.set_value_no_signal( _value )
	value_label.text = str( value )


### Signal : Receiver ############################################
func _on_h_slider_value_changed(value: float) -> void:
	value_changed.emit( value )
	value_label.text = str( value )
