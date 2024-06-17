extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Click Sprite" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	$Sprite2D.set_position( get_viewport().size * 0.5 )


func _unhandled_input( event ):
	if event is InputEventMouseButton:
		if not event.is_pressed():
			return
		
		if MOUSE_BUTTON_LEFT != event.button_index:
			return
		
		if not $Sprite2D.get_rect().has_point( $Sprite2D.to_local( event.position ) ):
			return
		
		print( "done" )
