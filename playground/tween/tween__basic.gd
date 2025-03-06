class_name tween__basic extends GDPTScene



### Variable #####################################################
var tween : Tween


### GDPT Override ################################################
static func scene_name()->String:
	return "Tween : Basic"


static func scene_path()->String:
	return super.scene_path()



### Override #####################################################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_split()
	pam.add_action( "do 1", KEY_1, do_1 )
	pam.add_action( "do 2", KEY_2, do_2 )
	pam.add_action( "do 3", KEY_3, do_3 )
	build_summary( eSceneType.TEST )

func _process( _delta: float ) -> void:
	print( "Tween Count : %d" % get_tree().get_processed_tweens().size() )



### Interface ####################################################
func do_1()->void:
	if tween:
		tween.kill()
	
	tween = create_tween()
	tween.tween_property( $helper_circle, "position:x", 50, 1 )
	tween.tween_interval( 1 )
	tween.tween_property( $helper_circle, "position:y", 50, 1 )
	tween.set_loops( 3 )
	tween.loop_finished.connect(
		func( _loop_count : int )->void:
			$helper_circle.position = Vector2.ZERO
	)


func do_2()->void:
	if tween:
		tween.kill()
	
	tween = create_tween()
	tween.tween_property( $helper_circle, "position", Vector2( -50, -50 ), 1 ).as_relative()


func do_3()->void:
	if tween:
		tween.kill()
	
	tween = create_tween()
	tween.set_parallel()
	tween.tween_property( $helper_circle, "position:x", 50, 1 )
	tween.tween_property( $helper_circle, "position:y", -50, 1 )
