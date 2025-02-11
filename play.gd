extends Button

var is_play := true


func _ready():
	Signals.finished_playing.connect(on_finished_playing)
	Signals.stop.connect(on_finished_playing)


func _pressed():
	if is_play:
		text = "Pause"
		is_play = false
		Signals.play.emit()
	else:
		text = "Play"
		is_play = true
		Signals.pause.emit()


func on_finished_playing():
	text = "Play"
	is_play = true
