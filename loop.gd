extends CheckButton


func _ready():
	toggled.connect(on_toggled)


func on_toggled(toggled_on: bool):
	Signals.set_loop.emit(toggled_on)
