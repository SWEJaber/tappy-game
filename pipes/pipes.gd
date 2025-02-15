extends Node2D

class_name Pipes



const SCROLL_SPEED: float = 150

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= SCROLL_SPEED * delta 
	check_off_screen()

func check_off_screen() -> void: 
	if position.x < -500: 
		queue_free()
	

# May not work properly on a Macbook when you minimize the game window
func _on_screen_exited() -> void:
	queue_free()
