class_name editor___label_property extends GDPTScene



### GDPT Override ################################################
static func scene_name()->String:
	return "Editor Root"


static func scene_path()->String:
	return super.scene_path()



### Override #####################################################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_lf()
	pam.add_front( playground_main.scene_name(),		Key.KEY_ESCAPE, playground_main.scene_path() )
	pam.add_lf2()
	pam.add_message( "0. This Scene Not Need Run" )
	pam.add_message( "1. Only Need Inspector" )
	pam.add_message( "2. Show Canvaslayer Inspector" )
	pam.add_message( "3. Input \"Label Text\"" )
	pam.add_lf()
	pam.add_split()
	build_summary( eSceneType.TEST )
