extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "UI" )
	pam.add_split()
	pam.add_mover( "2D Root",		Key.KEY_ESCAPE, "res://2d/2d_root.tscn" )
	pam.add_lf()
	pam.add_mover( "Label",  					Key.KEY_1, 		"res://2d/ui/ui_label.tscn" )
	pam.add_mover( ui_label_align.scene_name(), Key.KEY_2, 		"res://2d/ui/ui_label_align.tscn" )
	build_summary( eSceneType.ROOT )
