extends MarginContainer

@onready var window = get_window()
@onready var button_bar : HBoxContainer = $VBoxContainer/ButtonBar
@onready var slider_box : HBoxContainer = $VBoxContainer/MarginContainer/SliderBox
@onready var video_player : VideoStreamPlayer = $VBoxContainer/CenterContainer/VideoStreamPlayer

var video_size : Vector2
var video_scale : Vector2

func _ready():
	Signals.zoom.connect(on_zoom)
	Signals.resize.connect(on_video_resize)
	resize()


func resize():
	var new_size = video_size * video_scale + Vector2(0, button_bar.size.y + slider_box.size.y)
	new_size = new_size.max(Vector2(640, 480))
	window.size = new_size
	video_player.custom_minimum_size = video_size * video_scale


func on_zoom(p_scale: float):
	video_scale = Vector2(p_scale, p_scale)
	resize()


func on_video_resize(p_video_size: Vector2):
	video_size = p_video_size
	video_scale = Vector2.ONE
	resize()
