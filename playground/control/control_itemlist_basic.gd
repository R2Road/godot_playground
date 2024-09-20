class_name control_itemlist_basic extends GDPTScene



######################### GDPT Override ##########################
static func scene_name()->String:
	return "ItemList : Basic"


static func scene_path()->String:
	return super.scene_path()



############################ Override ############################
func _ready():
	pam.set_name( scene_name() )
	pam.add_split()
	pam.add_back( Key.KEY_ESCAPE )
	pam.add_lf()
	pam.add_action( "Clear All Item", Key.KEY_1, clear_all_item )
	pam.add_lf()
	pam.add_action( "Add Item", 			Key.KEY_Q, add_item )
	pam.add_action( "Add Item with Icon", 	Key.KEY_W, add_item_with_icon )
	pam.add_action( "Add Icon Item", 		Key.KEY_E, add_icon_item )
	build_summary( eSceneType.TEST )
	
	#
	# Start Practice
	#



############################   User   ############################
func clear_all_item():
	$ItemList.clear()


func add_item():
	$ItemList.add_item( "add_item()" )


func add_item_with_icon():
	$ItemList.add_item( "add_item() with icon", ResourceLoader.load( "res://icon.png" ) )


func add_icon_item():
	$ItemList.add_icon_item( ResourceLoader.load( "res://icon.png" ) )
