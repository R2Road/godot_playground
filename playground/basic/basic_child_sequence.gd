class_name basic_child_sequence extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "Child Sequence"



############################ Override ############################
func _ready():
	pam.set_name( basic_child_sequence.scene_name() )
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "Add Child", Key.KEY_1, add_test_node )
	pam.add_lf()
	pam.add_action( "Change Z-order : First Child", Key.KEY_2, change_z )
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


func change_z():
	move_child( get_children()[0], -1 )
	
	show_childs()
