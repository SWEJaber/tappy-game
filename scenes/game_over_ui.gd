extends Control
@onready var game_over_label: Label = $"MarginContainer/Game Over Label"
@onready var space_label: Label = $"MarginContainer/Space Label"
@onready var timer: Timer = $Timer
@onready var sound: AudioStreamPlayer = $Sound


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	SignalManager.on_plane_died.connect(on_game_over)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if space_label.visible && Input.is_action_just_pressed("fly"):
		GameManager.load_main_menu_scene()
		

func on_game_over() -> void:
	show()
	timer.start()
	sound.play()

func _on_timer_timeout() -> void:
	game_over_label.hide()
	space_label.show()
