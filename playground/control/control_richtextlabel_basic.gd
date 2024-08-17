# REF : https://docs.godotengine.org/en/stable/tutorials/ui/bbcode_in_richtextlabel.html

class_name control_richtextlabel_basic extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "RichTextLabel"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( control_richtextlabel_basic.scene_name() )
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "BB : Toggle", Key.KEY_1, func():
		$RichTextLabel1.bbcode_enabled = !$RichTextLabel1.bbcode_enabled
		$RichTextLabel2.bbcode_enabled = !$RichTextLabel2.bbcode_enabled
	)
	build_summary( eSceneType.TEST )
