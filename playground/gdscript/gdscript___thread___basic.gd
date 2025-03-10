class_name gdscript___thread___basic extends GDPTScene



### GDPT Override ################################################
static func scene_name()->String:
	return "Thread : Basic"

static func scene_path()->String:
	return super.scene_path()



### Export #######################################################
@export var helper_output : GDPTHelper_Output
@export var helper_code : GDPTHelper_Code



### Variable #####################################################
var thread : Thread = Thread.new()

class ThreadHelper extends RefCounted:
	var limit_time : float = 0
	
	var last_time : float = 0
	var elapsed_time : float = 0
	
	func start( _limit_sec : float )->void:
		limit_time = _limit_sec * 1000
		
		last_time = Time.get_ticks_msec()
	
	func update()->bool:
		elapsed_time += ( Time.get_ticks_msec() - last_time )
		last_time = Time.get_ticks_msec()
		
		return ( limit_time >= elapsed_time )
	
	func get_sec()->float:
		return elapsed_time * 0.001

var thread_helper : ThreadHelper = ThreadHelper.new()



### Override #####################################################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "Do", Key.KEY_1, do )
	pam.add_split()
	build_summary( eSceneType.TEST )
	
	#
	# Code Edit
	#
	helper_code.show_code( scene_path().replace( ".tscn", ".gd" ), 1, 10 )


func _process(delta: float) -> void:
	if thread.is_alive():
		helper_output.print( str( thread_helper.get_sec() ) )



### Interface ####################################################
func do()->void:
	if thread.is_alive():
		return
	
	thread_helper.start( 3 )
	thread.start( thread_function.bind( thread_helper ) )


func thread_function( thread_helper : ThreadHelper )->void:
	while thread_helper.update():
		pass
