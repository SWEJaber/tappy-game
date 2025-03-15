extends Control

@onready var score_label: Label = $"MarginContainer/Score Label"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score_label.text = "0"
	
	SignalManager.on_score_change.connect(adjust_score_label)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func adjust_score_label() -> void:
	score_label.text = str(ScoreManager.score) 
