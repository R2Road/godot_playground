class_name click_sprite extends GDPTScene



############################ Variable ############################
var click_count : int = 0



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Click Sprite"



############################ Override ############################
func _ready():
	pam.set_name( click_sprite.scene_name() )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )


func _unhandled_input( event ):
	if not event is InputEventMouseButton:
		return
		
	if not event.is_pressed():
		return
	
	if MOUSE_BUTTON_LEFT != event.button_index:
		return
	
	if not $Sprite2D.get_rect().has_point( $Sprite2D.to_local( event.position ) ):
		return
	
	click_count += 1
	$Sprite2D/Label.text = str( click_count )
