class_name rotation_tracking extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Rotation Tracking"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( rotation_tracking.scene_name() )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	$Target/helper_drag.signal_position_changed.connect( update_pivot )
	
	update_pivot( $Target.position )


############################   User   ############################
func update_pivot( target_position ):
	var direction = ( target_position - $Center.position )
	
	$Pivot.rotation = direction.angle()
	$Pivot.point_end.x = direction.length()
	
	$Target/Label.text = str( direction.angle() ).substr( 0, 5 )
