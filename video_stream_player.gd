extends VideoStreamPlayer

var paused_before_drag := false
var duration := 0.


func _ready():
	Signals.load_video.connect(on_load)
	Signals.play.connect(on_play)
	Signals.pause.connect(on_pause)
	Signals.stop.connect(on_stop)
	Signals.slider_drag_start.connect(on_slider_drag_start)
	Signals.slider_drag_end.connect(on_slider_drag_end)
	Signals.set_loop.connect(on_set_loop)
	finished.connect(on_finished)
	if stream:
		duration = get_stream_length()


func _process(_delta: float):
	if not paused:
		Signals.slider_update.emit(get_stream_position(), duration)


func on_finished():
	Signals.finished_playing.emit()


func on_load(file: String):
	if (is_playing()):
		stop()
		Signals.finished_playing.emit()
	stream.file = file
	duration = get_stream_length()
	Signals.resize.emit(get_video_texture().get_size())


func on_play():
	if not stream.file:
		Signals.finished_playing.emit()
		return
	paused = false
	if not is_playing():
		play()


func on_stop():
	stop()


func on_pause():
	paused = true


func on_slider_drag_start():
	paused_before_drag = paused
	paused = true


func on_slider_drag_end(value_changed: bool, p_value: float):
	if value_changed:
		set_stream_position(p_value)
	paused = paused_before_drag


func on_set_loop(toggled_on: bool):
	loop = toggled_on
