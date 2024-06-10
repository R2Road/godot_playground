extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "UI" )
	pam.add_mover( "Playground",	Key.KEY_ESCAPE,	"res://playground_main.tscn" )
	pam.add_mover( "Label",  		Key.KEY_1, 		"res://gds_ui/gds_ui_LabelScene.tscn" )
	build_summary( eSceneType.ROOT )
