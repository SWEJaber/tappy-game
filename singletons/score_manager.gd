extends Node

const SCORE_PATH = "user://tappy.dat"

var score: int = 0
var high_score: int = 0

func _ready() -> void:
	load_high_score()
	SignalManager.on_plane_died.connect(on_game_over)

func increment_score() -> void:
	score+=1
	SignalManager.on_score_change.emit()
	
func reset_score() -> void: 
	score = 0

func change_highscore() -> void:
	if score > high_score:
		high_score = score
		save_high_score_to_file()
	
func on_game_over() -> void: 
	change_highscore()
	reset_score()

func load_high_score() -> void:
	var file: FileAccess = FileAccess.open(SCORE_PATH, FileAccess.READ)
	
	if file:
		if file.get_length() > 0:
			high_score = file.get_as_text().to_int()
			
			print("Loaded HS")
		else:
			print("Nothing in file")
		
		file.close()
	else:
		print("failed to load score file")

func save_high_score_to_file() -> void:
	var file: FileAccess = FileAccess.open(SCORE_PATH, FileAccess.WRITE)
	
	if file:
		file.store_string(str(high_score))
		file.close()
