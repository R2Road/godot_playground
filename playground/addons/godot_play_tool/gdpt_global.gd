extends Node



### Variable #####################################################
var version : String

var on_debug = true
var on_assert = true

const scene_helper_packed_scrpit = preload( "res://addons/godot_play_tool/scene/gdpt_scene_helper.gd" )

# 
const helper_circle_packed_scene = preload( "res://addons/godot_play_tool/helper/helper_circle.tscn" )
const helper_drag_packed_scene = preload( "res://addons/godot_play_tool/helper/helper_drag.tscn" )
const helper_line_packed_scene = preload( "res://addons/godot_play_tool/helper/helper_line.tscn" )
const helper_move2center_packed_scene = preload( "res://addons/godot_play_tool/helper/helper_move2center.tscn" )
const helper_point_packed_scene = preload( "res://addons/godot_play_tool/helper/helper_point.tscn" )
const helper_rect_packed_scene = preload( "res://addons/godot_play_tool/helper/helper_rect.tscn" )
const helper_reticle_packed_scene = preload( "res://addons/godot_play_tool/helper/helper_reticle.tscn" )
const helper_0_0_packed_scene = preload( "res://addons/godot_play_tool/helper/helper_0_0.tscn" )

# Input
const helper_input_packed_scene = preload( "res://addons/godot_play_tool/helper/helper_input.tscn" )

# U.I
const helper_hslider_packed_scene = preload( "res://addons/godot_play_tool/helper/helper_hslider.tscn" )

# Pragma
const helper_code_packed_scene = preload( "res://addons/godot_play_tool/helper/helper_code.tscn" )
const helper_output_packed_scene = preload( "res://addons/godot_play_tool/helper/helper_output.tscn" )

# Tool
const helper_controller_packed_script = preload( "res://addons/godot_play_tool/helper/helper_controller.gd" )



### Override #####################################################
func _init()->void:
	add_to_group( "autoload" )

func _enter_tree()->void:
	# 호출 된다.
	print( "GDPT : Enter Tree" )
	
	var cf = ConfigFile.new()
	if Error.OK == cf.load( "res://addons/godot_play_tool/plugin.cfg" ):
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
	canvas_layer.set_script( GDPT.scene_helper_packed_scrpit )
	return canvas_layer


func _assert( flag = false )->void:
	if on_assert:
		assert( flag )

func _assert_f( flag = false )->void:
	assert( flag )


func _debug_print( f : Callable )->void:
	if on_debug:
		print( f.call() )
