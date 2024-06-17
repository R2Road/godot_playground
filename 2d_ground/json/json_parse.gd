extends PlaygroundScene



############################ Override ############################
func _ready():
	pam.set_name( "Json : Parse" )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#
	parse_failed_1()
	parse_failed_2()
	parse_succeed_1()
	parse_succeed_2()



############################   User   ############################
func parse_failed_1():
	var s : String = ""
	var c = JSON.parse_string( s )
	
	$Failed_1.text = (
		"string : " + s
		+ "\n"
		+ "result : " + str( c )
	)
	$Failed_1.set_position(
		Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.2 )
		- ( $Failed_1.get_minimum_size() * $Failed_1.get_scale() * 0.5 )
	)
func parse_failed_2():
	var s : String = "[1, 2, 3"
	var c = JSON.parse_string( s )
	
	$Failed_2.text = (
		"string : " + s
		+ "\n"
		+ "result : " + str( c )
	)
	$Failed_2.set_position(
		Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.4 )
		- ( $Failed_2.get_minimum_size() * $Failed_2.get_scale() * 0.5 )
	)


func parse_succeed_1():
	var s : String = "[2, 3, 4]"
	var c = JSON.parse_string( s )
	
	$Succeed_1.text = (
		"string : " + s
		+ "\n"
		+ "result : " + str( c )
	)
	$Succeed_1.set_position(
		Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.6 )
		- ( $Succeed_1.get_minimum_size() * $Succeed_1.get_scale() * 0.5 )
	)

func parse_succeed_2():
	var s : String = "[2, 3, 4, 5, 6, ]"
	var c = JSON.parse_string( s )
	
	$Succeed_2.text = (
		"string : " + s
		+ "\n"
		+ "result : " + str( c )
	)
	$Succeed_2.set_position(
		Vector2( get_viewport().size.x * 0.5, get_viewport().size.y * 0.8 )
		- ( $Succeed_2.get_minimum_size() * $Succeed_2.get_scale() * 0.5 )
	)
