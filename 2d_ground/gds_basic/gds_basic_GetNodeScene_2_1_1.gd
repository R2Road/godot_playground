extends Label


func _ready():
	DoPractice()


func DoPractice():
	get_node( "../../../3" ).set_position( Vector2( 550, 150 ) )
	
	var label_3_1_1 = get_node( "../../../3/3_1/3_1_1" )
	label_3_1_1.set_position( Vector2( 50, 50 ) )
	
	label_3_1_1.get_node( "../../3_1").set_position( Vector2( 50, 50 ) )
