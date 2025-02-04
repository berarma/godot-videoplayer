extends Button

var is_play := true


func _ready():
	Signals.finished_playing.connect(on_finished_playing)
	Signals.stop.connect(on_finished_playing)


func _pressed():
	if is_play:
		Signals.play.emit()
		text = "Pause"
		is_play = false
	else:
		Signals.pause.emit()
		text = "Play"
		is_play = true


func on_finished_playing():
	text = "Play"
	is_play = true
