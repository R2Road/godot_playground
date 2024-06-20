extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "ETC Root" )
	pam.add_split()
	pam.add_mover( "Playground",		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Click Sprite",		Key.KEY_1, 		"res://etc/etc_click_sprite.tscn" )
	pam.add_mover( "Timer",				Key.KEY_2, 		"res://etc/etc_timer.tscn" )
	pam.add_mover( "Screen Exit",		Key.KEY_3, 		"res://etc/etc_screen_exit.tscn" )
	pam.add_lf()
	pam.add_mover( "Test change scene without PlaygroundScene",	Key.KEY_SPACE,	"res://etc/dummy.tscn" )
	build_summary( eSceneType.ROOT )
