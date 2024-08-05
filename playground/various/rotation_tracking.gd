class_name rotation_tracking extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Rotation Tracking"


static func scene_path()->String:
	return super.scene_path()



############################ Variable ############################
var target_direction : Vector2
var on_tracking = false



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
	if $Pivot.rotation != $Tracker.rotation:
		var s = $Pivot.rotation - $Tracker.rotation
		if 0 < s:
			$Tracker.rotation += 1 * delta
			if 0 > $Pivot.rotation - $Tracker.rotation:
				$Tracker.rotation = target_direction.angle()
		elif 0 > s:
			$Tracker.rotation -= 1 * delta
			if 0 < $Pivot.rotation - $Tracker.rotation:
				$Tracker.rotation = target_direction.angle()
		
		$Target/T.text = str( $Tracker.rotation ).substr( 0, 5 )
		$Target/S.text = str( s ).substr( 0, 5 )


############################   User   ############################
func update_pivot( target_position ):
	target_direction = ( target_position - $Center.position )
	
	$Pivot.rotation = target_direction.angle()
	$Pivot.point_end.x = target_direction.length()
	$Tracker.point_end.x = target_direction.length()
	
	$Target/P.text = str( target_direction.angle() ).substr( 0, 5 )
	
	var d1 = $Pivot.rotation - $Tracker.rotation
	print( "d1 : " + str( d1 ) )
	
	#
	on_tracking = $Pivot.rotation != $Tracker.rotation
