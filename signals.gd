extends Node

@warning_ignore("unused_signal")
signal finished_playing
@warning_ignore("unused_signal")
signal open_file
@warning_ignore("unused_signal")
signal open_file_select(action: String, file: String)
@warning_ignore("unused_signal")
signal load_video(file: String)
@warning_ignore("unused_signal")
signal play
@warning_ignore("unused_signal")
signal pause
@warning_ignore("unused_signal")
signal stop
@warning_ignore("unused_signal")
signal zoom(scale: float)
@warning_ignore("unused_signal")
signal resize_window
@warning_ignore("unused_signal")
signal slider_drag_start
@warning_ignore("unused_signal")
signal slider_drag_end(value_changed: bool, value: float)
@warning_ignore("unused_signal")
signal slider_update(value: float, duration: float)
@warning_ignore("unused_signal")
signal set_loop(toggled_on: bool)
