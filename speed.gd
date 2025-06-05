extends HSlider


func _ready():
	value_changed.connect(on_value_changed)


func on_value_changed(_value_changed: bool):
	Signals.speed_update.emit(value)
