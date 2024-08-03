# REF : https://docs.godotengine.org/en/stable/tutorials/ui/bbcode_in_richtextlabel.html

class_name control_richtextlabel_auto_resize extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "RichTextLabel : Auto-Resize"



############################ Override ############################
func _ready():
	pam.set_name( control_richtextlabel_auto_resize.scene_name() )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "Change Text 1", Key.KEY_1, func(): change_text( "1234567890" ) )
	pam.add_action( "Change Text 2", Key.KEY_2, func(): change_text( "a" ) )
	pam.add_action( "Change Text 3", Key.KEY_3, func(): change_text( "a\n1234567890\nabcdefghijklmnopqrstuvwxyz\npoi098" ) )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	change_text( "a" )


func change_text( str ):
	$RichTextLabel.text = str
	$Label.text = "minimum_size : " + str( $RichTextLabel.get_minimum_size() )
	$Label.text += "\n"
	$Label.text += "size : " + str( $RichTextLabel.size )
	
	$RichTextLabel/helper_move2center.do.call_deferred()
