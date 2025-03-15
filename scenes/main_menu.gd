extends Control

@onready var highscore_value: Label = $"MarginContainer/Highscore Value"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	highscore_value.text = str(ScoreManager.high_score)
	SignalManager.on_plane_died.connect(change_highscore)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("fly"):
		GameManager.load_game_scene()

func change_highscore() -> void:
	highscore_value.text = str(ScoreManager.high_score)
