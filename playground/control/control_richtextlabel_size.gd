# REF : https://docs.godotengine.org/en/stable/tutorials/ui/bbcode_in_richtextlabel.html

class_name control_richtextlabel_size extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "RichTextLabel : Size"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "Change Text 1", Key.KEY_1, func(): change_text( "1234567890" ) )
	pam.add_action( "Change Text 2", Key.KEY_2, func(): change_text( "a" ) )
	pam.add_action( "Change Text 3", Key.KEY_3, func(): change_text( "a\n1234567890\nabcdefghijklmnopqrstuvwxyz\npoi098" ) )
	pam.add_action( "Change Text 4", Key.KEY_4, func(): change_text( "BBCode [color=green]test[/color]\n[b]{text}[/b]\n[i]{text}[/i]\n[u]{text}[/u]" ) )
	pam.add_lf()
	pam.add_action( "BB : Toggle", Key.KEY_Q, func(): $RichTextLabel.bbcode_enabled = !$RichTextLabel.bbcode_enabled )
	pam.add_lf()
	pam.add_message( "Node의 Text를 교체한다고 size 값이 바로 갱신되는 것이 아니다." )
	pam.add_message( "크기 변경을 확실히 감지해서 반응하려면 \"minimum_size_changed\" signal을 이용해야만 한다." )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	change_text( "a" )


func change_text( str ):
	print( "change_text : Start" )
	
	$RichTextLabel.text = str
	$Label.text = "minimum_size : " + str( $RichTextLabel.get_minimum_size() )
	$Label.text += "\n"
	$Label.text += "size : " + str( $RichTextLabel.size )
	$Label.text += "\n"
	$Label.text += "custom minimum size : " + str( $RichTextLabel.custom_minimum_size )
	
	$RichTextLabel/helper_move2center.do.call_deferred()
	
	print( "change_text : End" )



############################  Signal  ############################
func _on_rich_text_label_minimum_size_changed() -> void:
	print( "_on_rich_text_label_minimum_size_changed : Called"  )
