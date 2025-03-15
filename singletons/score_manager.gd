extends Node

var score: int = 0
var high_score: int = 0

func _ready() -> void:
	SignalManager.on_plane_died.connect(on_game_over)

func increment_score() -> void:
	score+=1
	SignalManager.on_score_change.emit()
	

func reset_score() -> void: 
	score = 0

func change_highscore() -> void:
	if score > high_score:
		high_score = score

func on_game_over() -> void: 
	
	var scores = { "score": score, "high_score": high_score }
	
	print("game over score!", scores)
	change_highscore()
	reset_score()
