extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Control" )
	pam.add_split()
	pam.add_mover( playground_main.scene_name(),	Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Label",  					Key.KEY_1, 	"res://control/control_label.tscn" )
	pam.add_mover( control_label_align.scene_name(), 			Key.KEY_2, 	"res://control/control_label_align.tscn" )
	pam.add_mover( control_nine_patch_rect_basic.scene_name(),	Key.KEY_3, 		"res://control/control_nine_patch_rect_basic.tscn" )
	pam.add_mover( control_progress_bar_basic.scene_name(),		Key.KEY_4, 		"res://control/control_progress_bar_basic.tscn" )
	build_summary( eSceneType.ROOT )
