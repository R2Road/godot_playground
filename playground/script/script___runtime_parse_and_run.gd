class_name script___runtime_parse_and_run extends GDPTScene



### Variable #####################################################



### GDPT Override ################################################
static func scene_name()->String:
	return "Script : Runtime Parse And Run"


static func scene_path()->String:
	return super.scene_path()



### Override : Node ##############################################
func _ready():
	pam.set_name( scene_name() )
	pam.add_lf()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	build_summary( eSceneType.TEST )
	
	#
	#
	#
	do()



### Interface ####################################################
func do():
	var script = GDScript.new()
	script.source_code = \
"class_name AA extends RefCounted

var label : Label

func do()->void:
	label.text = \"[Success] : Dynamically Parse And Call\"
	label.text += '\n'
	label.text += '\n'
	label.text += str( self.get_script().get_script_method_list() )
	label.get_node_or_null( \"helper_move2center\" ).do()
"
	script.reload()
	
	var r = Resource.new()
	r.set_script( script )
	
	self.get_script()
	
	
	r.label = $Label
	r.do()
