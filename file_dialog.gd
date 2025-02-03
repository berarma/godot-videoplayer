extends FileDialog


func _ready():
	Signals.open_file.connect(open)
	file_selected.connect(on_file_selected)


func open():
	visible = true


func on_file_selected(file: String):
	Signals.open_file_select.emit(file)
