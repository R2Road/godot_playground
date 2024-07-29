class_name control_label_align extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Label : Align"



############################ Override ############################
func _ready():
	pam.set_name( control_label_align.scene_name() )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "H Alignment : L", 	Key.KEY_Q, func(): change_horizontal_alignment( HorizontalAlignment.HORIZONTAL_ALIGNMENT_LEFT ) )
	pam.add_action( "H Alignment : C", 	Key.KEY_W, func(): change_horizontal_alignment( HorizontalAlignment.HORIZONTAL_ALIGNMENT_CENTER ) )
	pam.add_action( "H Alignment : R", 	Key.KEY_E, func(): change_horizontal_alignment( HorizontalAlignment.HORIZONTAL_ALIGNMENT_RIGHT ) )
	pam.add_lf()
	pam.add_action( "V Alignment : L", 	Key.KEY_A, func(): change_vertical_alignment( VerticalAlignment.VERTICAL_ALIGNMENT_TOP ) )
	pam.add_action( "V Alignment : C", 	Key.KEY_S, func(): change_vertical_alignment( VerticalAlignment.VERTICAL_ALIGNMENT_CENTER ) )
	pam.add_action( "V Alignment : R", 	Key.KEY_D, func(): change_vertical_alignment( VerticalAlignment.VERTICAL_ALIGNMENT_BOTTOM ) )
	pam.add_lf()
	pam.add_message( "Alignment 속성은 Control>Layout>Transform 에 설정된 size의 범위에서 작동한다." )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	$Label/helper_rect.rect.size = $Label.size


func change_horizontal_alignment( a : HorizontalAlignment ):
	$Label.horizontal_alignment = a


func change_vertical_alignment( a : VerticalAlignment ):
	$Label.vertical_alignment = a
