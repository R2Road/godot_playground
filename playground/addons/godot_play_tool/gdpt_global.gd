extends Node



############################ Variable ############################
var version : String
var on_assert = true



############################ Override ############################
func _enter_tree():
	# 호출 된다.
	print( "GDPT : Enter Tree" )
	
	var cf = ConfigFile.new()
	cf.load( "res://addons/godot_play_tool/plugin.cfg" )
	version = cf.get_value( "plugin", "version" )


func _exit_tree():
	# 호출 안된다. ( 왜? )
	print( "GDPT : Exit Tree" )



############################   User   ############################
func _assert( flag ):
	if on_assert:
		assert( flag )
