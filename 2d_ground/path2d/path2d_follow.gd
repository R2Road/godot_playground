extends PlaygroundScene



############################ Variable ############################
var elapsed_time = 0
@onready var follow = $Path2D/PathFollow2D



############################ Override ############################
func _ready():
	pam.set_name( "Path2D : Follow" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#


func _physics_process( delta ):
	#
	# Sprite2D_1 : PathFollow2D에 자식 노드를 붙여 놓으면 알아서 움직인다.
	#
	follow.progress += delta * 200
	
	#
	# Sprite2D_2기
	#
	$Sprite2D_2.position = ( get_viewport().size * 0.5 ) + follow.global_position
	
	#
	# $path2d_follow_helper/Sprite2D : Scene 으로 만들어서 써보기.
	#
	$path2d_follow_helper/Path2D/PathFollow2D.progress += delta * 200
	$path2d_follow_helper/Sprite2D.position = $path2d_follow_helper/Path2D/PathFollow2D.global_position
	
