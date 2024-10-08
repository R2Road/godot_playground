class_name script___runtime_parse_and_run extends GDPTScene



### OnReady ######################################################
@onready var code_edit = $CodeEdit



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
	pam.add_action( "Run Code", Key.KEY_SPACE, do )
	build_summary( eSceneType.TEST )
	
	#
	#
	#
	code_edit.text = \
"class_name AA extends RefCounted

var label : Label

func do()->void:
	label.text = \"[Success] : Dynamically Parse And Call\"
	label.text += '\n'
	label.text += '\n'
	label.text += str( self.get_script().get_script_method_list() )
	label.get_node_or_null( \"helper_move2center\" ).do()
"



### Interface ####################################################
func do():
	var script = GDScript.new()
	script.source_code = code_edit.text
	
	var parse_result = script.reload()
	if Error.OK == parse_result:
		var r = Resource.new()
		r.set_script( script )	
		
		r.label = $Label
		r.do()
	else:
		$Label.text = \
		  "[Failed] : Error Code - " \
		+ str( parse_result )
		$Label/helper_move2center.do()
