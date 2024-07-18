class_name DragSprite extends GDPTScene



############################ Variable ############################
var drag_on = false
var last_mouse_position : Vector2



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Drag Sprite"



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	$Sprite2D.set_position( get_viewport().size * 0.5 )


func _process( delta ):
	if drag_on:
		$Sprite2D.position += ( get_viewport().get_mouse_position() - last_mouse_position )
		last_mouse_position = get_viewport().get_mouse_position()

func _unhandled_input( event ):
	if not event is InputEventMouseButton:
		return
	
	if MOUSE_BUTTON_LEFT != event.button_index:
		return
	
	if drag_on:
		if event.is_released():
			drag_on = false
	else:
		if event.is_pressed():
			if $Sprite2D.get_rect().has_point( $Sprite2D.to_local( event.position ) ):
				drag_on = true
				last_mouse_position = get_viewport().get_mouse_position()
	
	# Input 전파 중지.
	get_viewport().set_input_as_handled()
