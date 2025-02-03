extends OptionButton


func _ready():
	item_selected.connect(on_item_selected)


func on_item_selected(index: int):
	Signals.zoom.emit(pow(2, index - 2))
