extends Node



### Variable #####################################################
var version : String

var on_debug = true
var on_assert = true

var scene_helper = preload( "res://addons/godot_play_tool/scene/gdpt_scene_helper.gd" )

# 
var helper_circle_scene = preload( "res://addons/godot_play_tool/helper/helper_circle.tscn" )
var helper_drag_scene = preload( "res://addons/godot_play_tool/helper/helper_drag.tscn" )
var helper_line_scene = preload( "res://addons/godot_play_tool/helper/helper_line.tscn" )
var helper_move2center_scene = preload( "res://addons/godot_play_tool/helper/helper_move2center.tscn" )
var helper_point_scene = preload( "res://addons/godot_play_tool/helper/helper_point.tscn" )
var helper_rect_scene = preload( "res://addons/godot_play_tool/helper/helper_rect.tscn" )
var helper_reticle_scene = preload( "res://addons/godot_play_tool/helper/helper_reticle.tscn" )
var helper_0_0_scene = preload( "res://addons/godot_play_tool/helper/helper_0_0.tscn" )

# U.I
var helper_hslider_scene = preload( "res://addons/godot_play_tool/helper/helper_hslider.tscn" )

# Pragma
var helper_code_scene = preload( "res://addons/godot_play_tool/helper/helper_code.tscn" )
var helper_output_scene = preload( "res://addons/godot_play_tool/helper/helper_output.tscn" )

# Tool
var helper_controller_script = preload( "res://addons/godot_play_tool/helper/helper_controller.gd" )



### Override #####################################################
func _init()->void:
	add_to_group( "autoload" )

func _enter_tree()->void:
	# 호출 된다.
	print( "GDPT : Enter Tree" )
	
	var cf = ConfigFile.new()
	cf.load( "res://addons/godot_play_tool/plugin.cfg" )
	version = (
		cf.get_value( "plugin", "alias" )
		+ " : v"
		+ cf.get_value( "plugin", "version" )
	)


func _exit_tree()->void:
	# 호출 안된다. ( 왜? )
	print( "GDPT : Exit Tree" )



### Interface ####################################################
func build_scene_helper()->Node:
	var canvas_layer = CanvasLayer.new()
	canvas_layer.name = "GDPTSceneHelper"
	canvas_layer.set_script( GDPT.scene_helper )
	return canvas_layer


func _assert( flag = false )->void:
	if on_assert:
		assert( flag )

func _assert_f( flag = false )->void:
	assert( flag )


func _debug_print( f : Callable )->void:
	if on_debug:
		print( f.call() )
