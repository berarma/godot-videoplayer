extends Button


func _pressed():
	Signals.stop.emit()
