extends GDPTScene



############################ Override ############################
func _ready():
	pam.set_name( "Get Node" )
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	DoPractice()



############################   User   ############################
func DoPractice():
	# 1
	get_node( "1" ).set_position( Vector2( 150, 150 ) )
	get_node( "1/1_1" ).set_position( Vector2( 50, 50 ) )
	
	
	# 2
	$"2".set_position( Vector2( 350, 150 ) )
	$"2/2_1".set_position( Vector2( 50, 50 ) )
	$"2/2_1/2_1_1".set_position( Vector2( 50, 50 ) )
	
	
	# 3 : 계층 거슬러 올라가기
	var node_3_1_1 = $"3/3_1/3_1_1"
	node_3_1_1.get_node( "../../../3" ).set_position( Vector2( 550, 150 ) )
	
	var label_3_1_1 = node_3_1_1.get_node( "../../../3/3_1/3_1_1" )
	label_3_1_1.set_position( Vector2( 50, 50 ) )
	
	label_3_1_1.get_node( "../../3_1" ).set_position( Vector2( 50, 50 ) )
	
	
	# 4
	var node_4 = get_node( "4" )
	node_4.set_position( Vector2( 750, 150 ) )
	
	var child_index = 1
	for c in node_4.get_children():
		c.set_position( Vector2( 50, 50 * child_index ) )
		child_index += 1
