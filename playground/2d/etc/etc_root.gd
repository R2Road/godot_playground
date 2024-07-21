extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "ETC Root" )
	pam.add_split()
	pam.add_mover( "2D Root",		Key.KEY_ESCAPE, "res://2d/2d_root.tscn" )
	pam.add_lf()
	pam.add_mover( click_sprite.scene_name(),		Key.KEY_1, 		"res://2d/etc/etc_click_sprite.tscn" )
	pam.add_mover( drag_sprite.scene_name(),	Key.KEY_2, 	"res://2d/etc/etc_drag_sprite.tscn" )
	pam.add_mover( "Timer",				Key.KEY_Q, 		"res://2d/etc/etc_timer.tscn" )
	pam.add_mover( "Screen Exit",		Key.KEY_W, 		"res://2d/etc/etc_screen_exit.tscn" )
	pam.add_mover( "Pause",				Key.KEY_E, 		"res://2d/etc/etc_pause.tscn" )
	pam.add_lf()
	pam.add_mover( "Test change scene without GDPTScene",	Key.KEY_SPACE,	"res://2d/etc/dummy.tscn" )
	build_summary( eSceneType.ROOT )
