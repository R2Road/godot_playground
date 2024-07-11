extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "UI" )
	pam.add_split()
	pam.add_mover( "2D Root",		Key.KEY_ESCAPE, "res://2d/2d_root.tscn" )
	pam.add_lf()
	pam.add_mover( "Label",  		Key.KEY_1, 		"res://2d/ui/ui_label.tscn" )
	build_summary( eSceneType.ROOT )
