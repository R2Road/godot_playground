extends Label


func _ready():
	DoPractice()


func DoPractice():
	set_position( Vector2( 750, 150 ) )
	
	var child_index = 1
	for c in self.get_children():
		c.set_position( Vector2( 50, 50 * child_index ) )
		child_index += 1
