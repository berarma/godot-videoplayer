extends MarginContainer

@onready var window = get_window()
@onready var button_bar : HBoxContainer = $VBoxContainer/ButtonBar
@onready var slider_box : HBoxContainer = $VBoxContainer/MarginContainer/SliderBox
@onready var video_player : VideoStreamPlayer = $VBoxContainer/VideoStreamPlayer


func _ready():
	Signals.zoom.connect(on_zoom)


func on_zoom(p_scale: float):
	video_player.scale = Vector2(p_scale, p_scale);
	window.size = video_player.size * video_player.scale + Vector2(0, button_bar.size.y + slider_box.size.y)
