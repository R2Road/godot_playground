class_name area2d___remove_entered_area extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Area2D : Remove Entered Area"
	

static func scene_path()->String:
	return super.scene_path()



############################ Variable ############################
const move_speed : int = 200


############################ Override ############################
func _ready():
	pam.set_name( "Area2D : Connect Signal in Script" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "Remove Sub Area", Key.KEY_1, ( func():
		var s = self.get_node_or_null( "SubArea" )
		s.queue_free()
	)  )
	pam.add_lf()
	pam.add_lf()
	pam.add_message( "enter signal이 작동한 node 는 삭제될 때 exit signal이 작동한다." )
	build_summary( eSceneType.TEST )
	
	#
	#
	#
	_on_main_area_area_exited( null )



############################  Signal  ############################
func _on_main_area_area_entered(area: Area2D) -> void:
	$Label.text = "Enter"


func _on_main_area_area_exited(area: Area2D) -> void:
	$Label.text = "Exit"
