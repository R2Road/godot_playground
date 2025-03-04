class_name GDPTHelper_Code extends BoxContainer



### Variable #####################################################
@export var code_edit : CodeEdit
@export var file_info_label : Label



### Interface ####################################################
func show_code( path : String, line_start : int, line_end : int )->void:
	var file = FileAccess.open( path, FileAccess.READ )
	
	# Move
	for i in line_start - 1:
		file.get_line()
	
	# Code 구성.
	var code : String
	for i in range( line_start, line_end + 1 ):
		code += file.get_line()
		if i != line_end:
			code += "\n"
	
	# Show
	code_edit.text = code
	
	# File Name
	file_info_label.text = path + " | " + str( line_start ) + " ~ " + str( line_end )
