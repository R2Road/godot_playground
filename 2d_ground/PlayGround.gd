extends Node2D

var title_string = \
	"Play Ground" \
	+ "\n" \
	+ "[ESC] Exit"

func _ready():
	var summury_node = get_node( "Summury" )
	summury_node.text = title_string
