extends Label


func _ready():
	DoPractice()


func DoPractice():
	$"../../../C".set_position( Vector2( 550, 150 ) )
	
	var label_C_1_1 = $"../../../C/C_1/C_1_1"
	label_C_1_1.set_position( Vector2( 50, 50 ) )
	
	label_C_1_1.get_node( "../../C_1").set_position( Vector2( 50, 50 ) )
