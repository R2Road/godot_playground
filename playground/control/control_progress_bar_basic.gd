class_name control_progress_bar_basic extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "ProgressBar : Basic"



############################ Override ############################
func _ready():
	pam.set_name( control_progress_bar_basic.scene_name() )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	$ProgressBar.value = $ProgressBar/HSlider.value


func _on_h_slider_value_changed( _value ):
	$ProgressBar.value = _value
