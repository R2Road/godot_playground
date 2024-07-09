extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "UI" )
	pam.add_split()
	pam.add_mover( "Playground",	Key.KEY_ESCAPE,	"res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Label",  		Key.KEY_1, 		"res://2d/ui/ui_label.tscn" )
	build_summary( eSceneType.ROOT )
