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
var tracking_speed = 1



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
	$Target/helper_drag.signal_position_changed.connect( update_pivot )
	
	update_pivot( $Target.position )
	
	_on_h_slider_value_changed( $HSlider.value )


func _process( delta ):
	if tracking_on:
		if 0 < tracking_direction:
			$Tracker.rotation -= tracking_speed * delta
			
			tracking_direction = tracking_vector.cross( Vector2.RIGHT.rotated( $Tracker.rotation ) )
			if 0 > tracking_direction:
				$Tracker.rotation = tracking_vector.angle()
				tracking_on = false
		elif 0 > tracking_direction:
			$Tracker.rotation += tracking_speed * delta
			
			tracking_direction = tracking_vector.cross( Vector2.RIGHT.rotated( $Tracker.rotation ) )
			if 0 < tracking_direction:
				$Tracker.rotation = tracking_vector.angle()
				tracking_on = false
		
		show_debug_info()


############################   User   ############################
func update_pivot( target_position ):
	#
	tracking_vector = ( target_position - $Center.position )
	
	#
	tracking_on = tracking_vector.angle() != $Tracker.rotation
	if not tracking_on:
		return
	
	#
	$Pivot.rotation = tracking_vector.angle()
	$Pivot.point_end.x = tracking_vector.length()
	$Tracker.point_end.x = tracking_vector.length()
	
	# 결과에 영향을 주지는 않지만 cross 결과가 증폭돼 나온다.
	tracking_vector = tracking_vector.normalized()
	
	#
	tracking_direction = tracking_vector.cross( Vector2.RIGHT.rotated( $Tracker.rotation ) )
	
	show_debug_info()


func show_debug_info():
	# Debug
	$Target/P.text = "Target Angle : " + str( tracking_vector.angle() ).substr( 0, 5 )
	$Target/T.text = "Tracker Angle: " + str( $Tracker.rotation ).substr( 0, 5 )
	$Target/S.text = (
		"Cross : " + str( tracking_direction ).substr( 0, 5 )
		+ "\n"
		+ "Dot : " + str( tracking_vector.dot( Vector2.RIGHT.rotated( $Tracker.rotation ) ) ).substr( 0, 5 )
	)


func _on_h_slider_value_changed( value ):
	tracking_speed = value
