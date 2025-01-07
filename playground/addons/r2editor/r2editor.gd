@tool
extends EditorPlugin

const editor_preload_scene = preload( "res://addons/r2editor/test_editpr_1.tscn" )

var dock_left
var dock_right

var container_toolbar
var container_canvaseditor

var main_panel_instance


func _enter_tree() -> void:
	#
	#
	#
	dock_left = editor_preload_scene.instantiate()
	add_control_to_dock( EditorPlugin.DOCK_SLOT_LEFT_UR, dock_left )
	
	dock_right = editor_preload_scene.instantiate()
	add_control_to_dock( EditorPlugin.DOCK_SLOT_RIGHT_UR, dock_right )
	
	#
	#
	#
	container_toolbar = editor_preload_scene.instantiate()
	add_control_to_container( EditorPlugin.CONTAINER_TOOLBAR, container_toolbar )
	
	container_canvaseditor = editor_preload_scene.instantiate()
	add_control_to_container( EditorPlugin.CONTAINER_CANVAS_EDITOR_MENU, container_canvaseditor )
	
	#
	#
	#
	main_panel_instance = editor_preload_scene.instantiate()
	EditorInterface.get_editor_main_screen().add_child( main_panel_instance )
	_make_visible(false)


func _exit_tree() -> void:
	#
	#
	#
	remove_control_from_docks( dock_left )
	dock_left.free()
	
	remove_control_from_docks( dock_right )
	dock_right.free()
	
	#
	#
	#
	remove_control_from_container( EditorPlugin.CONTAINER_TOOLBAR, container_toolbar )
	container_toolbar.free()
	
	remove_control_from_container( EditorPlugin.CONTAINER_CANVAS_EDITOR_MENU, container_canvaseditor )
	container_canvaseditor.free()
	
	#
	#
	#
	if main_panel_instance:
		main_panel_instance.queue_free()



func _has_main_screen() -> bool:
	return true

func _make_visible(visible):
	if main_panel_instance:
		main_panel_instance.visible = visible

func _get_plugin_name():
	return "Editor Practice"

func _get_plugin_icon():
	return EditorInterface.get_editor_theme().get_icon( "Node", "EditorIcons" )
