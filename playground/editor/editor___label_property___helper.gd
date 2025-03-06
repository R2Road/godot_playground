@tool
class_name editor___label_property___helper extends CanvasLayer



### Export #######################################################
@export var label : Label
@export var label_text : String:
	set( value ):
		label_text = value
		if label:
			label.set_text( value )
