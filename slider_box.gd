extends HBoxContainer

@onready var slider := $HSlider
@onready var time_pos_label := $TimePos
@onready var duration_label := $Duration


func _ready():
	Signals.slider_update.connect(slider_update)
	slider.drag_started.connect(on_drag_started)
	slider.drag_ended.connect(on_drag_ended)


func format_time(time: float) -> String:
	var seconds = floori(time) % 60
	@warning_ignore("integer_division")
	var minutes = floori(time / 60) % 60
	@warning_ignore("integer_division")
	var hours = floori(time / 3600)
	return "%02d:%02d:%02d.%02d" % [hours, minutes, seconds, floori(time * 100) % 100]


func slider_update(p_value: float, p_duration: float):
	slider.value = p_value
	slider.max_value = p_duration
	var time_pos = p_value
	time_pos_label.text = format_time(time_pos)
	var duration = p_duration
	duration_label.text = format_time(duration)


func on_drag_started():
	Signals.slider_drag_start.emit()


func on_drag_ended(value_changed: bool):
	Signals.slider_drag_end.emit(value_changed, slider.value)
