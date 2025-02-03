extends HBoxContainer

@onready var slider := $HSlider
@onready var time_pos_label := $TimePos
@onready var duration_label := $Duration


func _ready():
	Signals.slider_update.connect(slider_update)
	slider.drag_started.connect(on_drag_started)
	slider.drag_ended.connect(on_drag_ended)


func format_time(time: int) -> String:
	var seconds = time % 60
	@warning_ignore("integer_division")
	var minutes = (time / 60) % 60
	@warning_ignore("integer_division")
	var hours = time / 36004
	return "%02d:%02d:%02d" % [hours, minutes, seconds]


func slider_update(p_value: float, p_duration: float):
	slider.value = p_value
	slider.max_value = p_duration
	var time_pos = roundi(p_value)
	time_pos_label.text = format_time(time_pos)
	var duration = roundi(p_duration)
	duration_label.text = format_time(duration)


func on_drag_started():
	Signals.slider_drag_start.emit()


func on_drag_ended(value_changed: bool):
	Signals.slider_drag_end.emit(value_changed, slider.value)
