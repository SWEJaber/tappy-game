extends Node2D

class_name Pipes

const OFF_SCREEN: float = -500
@onready var score_sound: AudioStreamPlayer2D = $ScoreSound

func _ready() -> void:
	SignalManager.on_plane_died.connect(on_plane_died)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= GameManager.SCROLL_SPEED * delta 
	check_off_screen()

func check_off_screen() -> void: 
	if position.x < OFF_SCREEN: 
		queue_free()
	
func on_plane_died() -> void:
	set_process(false)

# May not work properly on a Macbook when you minimize the game window
func _on_screen_exited() -> void:
	queue_free()


func _on_pipe_body_entered(body: Node2D) -> void:	
	print("Pipe: ", body)
	if body is Tappy:
		body.die()


func _on_laser_body_entered(body: Node2D) -> void:
	if body is Tappy:
		score_sound.play()
		ScoreManager.increment_score()
		
