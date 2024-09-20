class_name control_slider_h_basic extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "H Slider : Basic"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	_on_h_slider_value_changed( $HSlider.value )


func _on_h_slider_value_changed( _value ):
	$HSlider/Label.text = str( _value )
