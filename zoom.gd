extends OptionButton


func _ready():
	item_selected.connect(on_item_selected)
	Signals.resize.connect(on_resize)


func on_item_selected(index: int):
	Signals.zoom.emit(pow(2, index - 2))


func on_resize(_size: Vector2):
	selected = 2
