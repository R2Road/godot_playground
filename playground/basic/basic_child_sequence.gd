class_name basic_child_sequence extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Child Sequence"



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "Add Child", Key.KEY_1, add_test_node )
	pam.add_lf()
	pam.add_action( "Change Z-order : First > End", Key.KEY_2, func(): change_z( -1 ) )
	pam.add_action( "Change Z-order : First > Half", Key.KEY_3, func(): change_z( int( get_child_count() * 0.5 ) ) )
	pam.add_action( "Change Z-order : First > Next", Key.KEY_4, func(): change_z( get_children()[0].get_index() + 1 ) )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	show_childs()



############################   User   ############################
func add_test_node():
	var n = Node.new()
	n.name = str( get_child_count() )
	add_child( n )
	
	show_childs()


func show_childs():
	$Label.text = ""
	for c in get_children():
		$Label.text += ( "[" + str( c.get_index() ) + "] " + c.name + "\n" )
	
	$Label/helper_move2center.do()


func change_z( new_z : int ):
	move_child( get_children()[0], new_z )
	
	show_childs()
