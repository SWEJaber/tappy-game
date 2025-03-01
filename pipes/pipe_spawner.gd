extends Node

const PIPES = preload("res://pipes/pipes.tscn")

@onready var spawn_u: Marker2D = $SpawnU
@onready var spawn_l: Marker2D = $SpawnL

@onready var spawn_timer: Timer = $"Spawn Timer"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_plane_died.connect(_on_plane_died)
	spawn_pipes()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

@onready var pipes_container: Node2D = $"../Pipes Container"


func spawn_pipes() -> void:
	var new_pipes: Pipes = PIPES.instantiate()
	
	var y_position: float = randf_range(spawn_u.position.y, spawn_l.position.y)
	
	pipes_container.add_child(new_pipes)
	
	new_pipes.global_position = Vector2(spawn_l.position.x, y_position)


func _on_plane_died() -> void:
	spawn_timer.stop()
