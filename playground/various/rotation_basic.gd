class_name rotation_basic extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Rotation Basic"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	$PivotRotator/helper_drag.signal_position_changed.connect( update_pivot )
	$TrackerRotator/helper_drag.signal_position_changed.connect( update_pivot )
	
	update_pivot( $PivotRotator.position )



############################   User   ############################
func update_pivot( _t ):
	#
	var pivot_vector = ( $PivotRotator.position - $Center.position )
	
	#
	var tracking_on = pivot_vector.angle() != $Tracker.rotation
	if not tracking_on:
		return
	
	var tracker_vector = ( $TrackerRotator.position - $Center.position )
	
	#
	$Pivot.rotation = pivot_vector.angle()
	$Pivot.point_end.x = pivot_vector.length()
	
	$Tracker.rotation = tracker_vector.angle()
	$Tracker.point_end.x = tracker_vector.length()
	
	# 결과에 영향을 주지는 않지만 cross 결과가 증폭돼 나온다.
	pivot_vector = pivot_vector.normalized()
	
	#
	var tracking_direction = pivot_vector.cross( Vector2.RIGHT.rotated( $Tracker.rotation ) )
	
	# Debug
	$PivotRotator/P.text = "Target Angle : " + str( pivot_vector.angle() ).substr( 0, 5 )
	$PivotRotator/T.text = "Tracker Angle: " + str( $Tracker.rotation ).substr( 0, 5 )
	$PivotRotator/S.text = (
		"Cross : " + str( tracking_direction ).substr( 0, 5 )
		+ "\n"
		+ "Dot : " + str( pivot_vector.dot( Vector2.RIGHT.rotated( $Tracker.rotation ) ) ).substr( 0, 5 )
	)
