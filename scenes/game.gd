extends Node2D

const PIPES = preload("res://pipes/pipes.tscn")

@onready var spawn_u: Marker2D = $Spawner/SpawnU
@onready var spawn_l: Marker2D = $Spawner/SpawnL



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass


@onready var pipes_container: Node2D = $"Pipes Container"

func spawn_pipes() -> void:
	var new_pipes: Pipes = PIPES.instantiate()
	
	var y_position: float = randf_range(spawn_u.position.y, spawn_l.position.y)
	
	pipes_container.add_child(new_pipes)
	
	new_pipes.global_position = Vector2(spawn_l.position.x, y_position)
