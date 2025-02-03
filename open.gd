extends Button

@onready var dialog := $"/root/VideoPlayer/FileDialog"


func _ready():
	Signals.open_file_select.connect(on_select)


func _pressed():
	Signals.open_file.emit()


func on_select(file: String):
	Signals.load_video.emit(file)
