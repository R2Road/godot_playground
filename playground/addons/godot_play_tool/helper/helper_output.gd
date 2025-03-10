class_name GDPTHelper_Output extends MarginContainer



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
func lf()->void:
	var l = label.duplicate()
	l.text = ""
	l.visible = true
	vbox_container.add_child( l )
	
	clamp_output()

func print( message : String )->void:
	var l = label.duplicate()
	l.text = message
	l.visible = true
	vbox_container.add_child( l )
	
	clamp_output()

func print_color( _message : String, _color : Color )->void:
	var l = label.duplicate()
	l.text = _message
	l.visible = true
	l.set( "theme_override_colors/font_color", _color )
	vbox_container.add_child( l )
	
	clamp_output()


func clamp_output()->void:
	var gap : int = vbox_container.get_child_count() - allowed_line_count
	if 0 < gap:
		for i in gap:
			vbox_container.remove_child( vbox_container.get_child( 0 ) )


func clear()->void:
	while 0 < vbox_container.get_child_count():
		vbox_container.remove_child( vbox_container.get_children()[0] )



### Signal : Receiver ############################################
func _on_scroll_bar_changed()->void:
	scroll_container.scroll_vertical = scroll_container.get_v_scroll_bar().max_value
