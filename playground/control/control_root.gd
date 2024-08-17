extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Control" )
	pam.add_split()
	pam.add_mover( playground_main.scene_name(),	Key.KEY_ESCAPE, playground_main.scene_path() )
	pam.add_lf()
	pam.add_mover( "Label",  					Key.KEY_1, 	"res://control/control_label.tscn" )
	pam.add_mover( control_label_align.scene_name(), 			Key.KEY_2, 		control_label_align.scene_path() )
	pam.add_mover( control_nine_patch_rect_basic.scene_name(),	Key.KEY_3, 		control_nine_patch_rect_basic.scene_path() )
	pam.add_mover( control_slider_h_basic.scene_name(),			Key.KEY_4, 		control_slider_h_basic.scene_path() )
	pam.add_mover( control_progress_bar_basic.scene_name(),		Key.KEY_5, 		control_progress_bar_basic.scene_path() )
	pam.add_mover( control_richtextlabel_basic.scene_name(),	Key.KEY_6, 		control_richtextlabel_basic.scene_path() )
	pam.add_mover( control_richtextlabel_size.scene_name(),		Key.KEY_7, 		control_richtextlabel_size.scene_path() )
	pam.add_lf()
	pam.add_mover( control_itemlist_basic.scene_name(),		Key.KEY_Q, 		control_itemlist_basic.scene_path() )
	build_summary( eSceneType.ROOT )
