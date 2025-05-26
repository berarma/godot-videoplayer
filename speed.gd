extends HSlider


func _ready():
	Signals.speed_update.connect(slider_update)
	value_changed.connect(on_value_changed)


func slider_update(p_value: float):
	value = p_value
	Engine.time_scale = value


func on_value_changed(_value_changed: bool):
	Signals.speed_update.emit(value)
