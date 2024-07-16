extends Node



############################ Variable ############################
var version : String
var on_assert = true

var scene_helper = preload( "res://addons/godot_play_tool/gdpt_scene_helper.gd" )

var helper_center_pivot = preload( "res://addons/godot_play_tool/helper/helper_center_pivot.tscn" )
var helper_circle = preload( "res://addons/godot_play_tool/helper/helper_circle.tscn" )
var helper_line = preload( "res://addons/godot_play_tool/helper/helper_line.tscn" )
var helper_move2center = preload( "res://addons/godot_play_tool/helper/helper_move2center.tscn" )
var helper_point = preload( "res://addons/godot_play_tool/helper/helper_point.tscn" )
var helper_rect = preload( "res://addons/godot_play_tool/helper/helper_rect.tscn" )



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
