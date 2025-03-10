@tool
class_name GDPTHelper_Volume extends MarginContainer



### Export #######################################################
@export var slider : GDPTHelper_HSlider

@export var bus_name : String:
	set( value ):
		if slider:
			slider.title_label.set_text( value )
	get():
		if slider:
			return slider.title_label.text
		else:
			return ""

@export var volume : float:
	set( _value ):
		if slider:
			slider.hslider.value = _value
	get():
		if slider:
			return slider.hslider.value
		else:
			return 0



### Variable #####################################################
var bus_index : int = 0



### Override #####################################################
func _ready()->void:
	bus_index = AudioServer.get_bus_index( bus_name )



### Interface ####################################################
func set_volume_no_signal( _percentage : float ) -> void:
	slider.set_value_no_signal( _percentage )


static func apply_volume( _bus_index : int, _percentage : float ) -> void:
	var scale : float = 20
	var divisor : float = 50
	
	var new_volume : float = scale * ( log( _percentage / divisor ) / log( 10 ) )
	
	AudioServer.set_bus_volume_db( _bus_index, new_volume )
	
	#print( "Volume : Percentage %f | DB : %f" % [_percentage, new_volume] )



### Signal : Receiver ############################################
func _on_helper_hslider_value_changed( _percentage : float ) -> void:
	apply_volume( bus_index, _percentage )
	
