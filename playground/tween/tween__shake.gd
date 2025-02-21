class_name tween__shake extends GDPTScene



### Variable #####################################################
var tween__shake_horizontal : Tween
var tween__shake_vertical : Tween


### GDPT Override ################################################
static func scene_name()->String:
	return "Tween : Shake"


static func scene_path()->String:
	return super.scene_path()



### Override #####################################################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_split()
	pam.add_action( "do", KEY_1, do )
	pam.add_action( "stop", KEY_2, stop )
	pam.add_action( "kill", KEY_3, kill )
	pam.add_lf()
	pam.add_lf()
	pam.add_subject( "Kill이 불리면 다음 실행 요청시에 아래와 같은 에러가 발생한다." )
	pam.add_note( "Tween invalid. Either finished or created outside scene tree." )
	build_summary( eSceneType.TEST )
	
	#
	#
	#
	tween__shake_horizontal = create_tween()
	tween__shake_horizontal.set_loops()
	tween__shake_horizontal.stop()
	tween__shake_horizontal.tween_property( $helper_circle, "position:x", -10, 0.01 )
	tween__shake_horizontal.tween_property( $helper_circle, "position:x", 0, 0.012 )
	tween__shake_horizontal.tween_property( $helper_circle, "position:x", 10, 0.01 )
	tween__shake_horizontal.tween_property( $helper_circle, "position:x", 0, 0.011 )
	
	tween__shake_vertical = create_tween()
	tween__shake_vertical.set_loops()
	tween__shake_vertical.stop()
	tween__shake_vertical.tween_property( $helper_circle, "position:y", -10, 0.012 )
	tween__shake_vertical.tween_property( $helper_circle, "position:y", 0, 0.01 )
	tween__shake_vertical.tween_property( $helper_circle, "position:y", 10, 0.011 )
	tween__shake_vertical.tween_property( $helper_circle, "position:y", 0, 0.012 )



### Interface ####################################################
func do()->void:
	tween__shake_horizontal.play()
	tween__shake_vertical.play()


func stop()->void:
	tween__shake_horizontal.stop()
	tween__shake_vertical.stop()


func kill()->void:
	tween__shake_horizontal.kill()
	tween__shake_vertical.kill()
