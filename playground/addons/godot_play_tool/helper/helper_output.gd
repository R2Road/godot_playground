class_name helper_output extends MarginContainer



### Export #######################################################
@export var allowed_line_count = 100



### OnReady ######################################################
@onready var scroll_container : ScrollContainer = $ScrollContainer
@onready var vbox_container : VBoxContainer = $ScrollContainer/VBoxContainer

@onready var label : Label = $Label



### Override #####################################################
func _ready()->void:
	var scroll_bar : VScrollBar = scroll_container.get_v_scroll_bar()
	scroll_bar.changed.connect( _on_scroll_bar_changed )



### Interface ####################################################
func add_normal( message : String )->void:
	var l = label.duplicate()
	l.text = message
	l.visible = true
	vbox_container.add_child( l )
	
	clamp_output()


func clamp_output()->void:
	var gap : int = vbox_container.get_child_count() - allowed_line_count
	if 0 < gap:
		for i in gap:
			print( i )
			vbox_container.remove_child( vbox_container.get_child( 0 ) )



### Signal : Receiver ############################################
func _on_scroll_bar_changed()->void:
	scroll_container.scroll_vertical = scroll_container.get_v_scroll_bar().max_value
