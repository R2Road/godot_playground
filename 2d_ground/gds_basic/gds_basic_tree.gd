extends PlaygroundScene



############################ Override ############################
func _ready():	
	scene_type = eSceneType.TEST
	
	pam.set_name( "Tree" )
	pam.add_mover( "Exit",	Key.KEY_ESCAPE,	"res://gds_basic/gds_basic_root.tscn" )
	
	build_summary()
	
	var tree_string : String
	
	# Subject
	tree_string += "# root scene은 항상 존재 하며 그 아래에 사용자가 정의한 main scene이 배치된다"
	
	tree_string += "\n\n"
	tree_string += "\n\n"
	
	# root name
	tree_string += "# get_tree().root.name"
	tree_string += "\n"
	tree_string += ( "     > " + get_tree().root.name )
	
	tree_string += "\n\n"
	
	# children name
	tree_string += "# get_tree().root.get_children() ~ name"
	tree_string += "\n"
	for c in get_tree().root.get_children():
		tree_string += ( "     > " + c.name )
	
	var label = Label.new()
	label.add_theme_color_override( "font_color", Color( 0, 1, 0, 1 ) )
	label.text = tree_string
	label.set_position(
		Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.5 )
		- Vector2( label.get_minimum_size().x * 0.5, label.get_minimum_size().y * 0.5 )
	)
	add_child( label )
