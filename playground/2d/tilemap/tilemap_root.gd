extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Tilemap Root" )
	pam.add_split()
	pam.add_mover( "Playground",		Key.KEY_ESCAPE, "res://playground_main.tscn" )
	pam.add_lf()
	pam.add_mover( "Basic", 		Key.KEY_1, "res://2d/tilemap/tilemap_basic.tscn" )
	pam.add_mover( "Animation", 	Key.KEY_2, "res://2d/tilemap/tilemap_animation.tscn" )
	pam.add_mover( "Pattern", 		Key.KEY_3, "res://2d/tilemap/tilemap_pattern.tscn" )
	pam.add_lf()
	pam.add_mover( "Physics", 		Key.KEY_Q, "res://2d/tilemap/tilemap_physics_01.tscn" )
	build_summary( eSceneType.ROOT )
