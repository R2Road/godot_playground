class_name rotation_tracking extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Rotation Tracking"


static func scene_path()->String:
	return super.scene_path()



############################ Variable ############################
var tracking_vector : Vector2
var tracking_on = false
var tracking_direction = 1



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


func _process( delta ):
	if tracking_on:
		if 0 < tracking_direction:
			$Tracker.rotation -= 1 * delta
			
			tracking_direction = tracking_vector.cross( Vector2.RIGHT.rotated( $Tracker.rotation ) )
			if 0 > tracking_direction:
				$Tracker.rotation = tracking_vector.angle()
				tracking_on = false
		elif 0 > tracking_direction:
			$Tracker.rotation += 1 * delta
			
			tracking_direction = tracking_vector.cross( Vector2.RIGHT.rotated( $Tracker.rotation ) )
			if 0 < tracking_direction:
				$Tracker.rotation = tracking_vector.angle()
				tracking_on = false
		
		$Target/T.text = str( $Tracker.rotation ).substr( 0, 5 )
		$Target/S.text = str( tracking_vector.dot( Vector2.RIGHT.rotated( $Tracker.rotation ) ) ).substr( 0, 5 )


############################   User   ############################
func update_pivot( target_position ):
	tracking_vector = ( target_position - $Center.position )
	
	$Pivot.rotation = tracking_vector.angle()
	$Pivot.point_end.x = tracking_vector.length()
	$Tracker.point_end.x = tracking_vector.length()
	
	tracking_vector = tracking_vector.normalized()
	
	$Target/P.text = str( tracking_vector.angle() ).substr( 0, 5 )
	
	#
	tracking_on = $Pivot.rotation != $Tracker.rotation
	if tracking_on:
		tracking_direction = tracking_vector.cross( Vector2.RIGHT.rotated( $Tracker.rotation ) )
	
	
	$Target/S.text = str( tracking_direction).substr( 0, 5 )
