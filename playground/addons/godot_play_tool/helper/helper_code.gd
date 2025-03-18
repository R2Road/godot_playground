class_name GDPTHelper_Code extends BoxContainer



### Variable #####################################################
@export var code_edit : CodeEdit
@export var file_info_label : Label



### Interface ####################################################
func show_all( path : String )->void:
	var file = FileAccess.open( path, FileAccess.READ )
	if Error.OK != file.get_open_error():
		code_edit.text = "[Failed] show_range : file open"
	
	# Code 구성.
	var code : String
	while true:
		code += file.get_line()
		
		if file.eof_reached():
			break
		
		code += "\n"
	
	# Show
	code_edit.text = code
	
	# File Name
	file_info_label.text = path


func show_range( path : String, line_start : int, line_end : int )->void:
	var file = FileAccess.open( path, FileAccess.READ )
	if Error.OK != file.get_open_error():
		code_edit.text = "[Failed] show_range : file open"
	
	# Move
	for i in line_start - 1:
		file.get_line()
	
	# Code 구성.
	var code : String
	for i in range( line_start, line_end + 1 ):
		code += file.get_line()
		
		if file.eof_reached():
			break
		
		if i != line_end:
			code += "\n"
	
	# Show
	code_edit.text = code
	
	# File Name
	file_info_label.text = path + " | " + str( line_start ) + " ~ " + str( line_end )
