extends CharacterBody2D

const GRAVITY: float = 1000.0
const POWER: float = -350.0

@onready var anim_sprite: AnimatedSprite2D = $AnimSprite


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	#	This will have an acceleration effect
	velocity.y += GRAVITY * delta
	
	fly()
#	This already multiplies the GRAVITY constant by delta
	move_and_slide()
	
	
	if is_on_floor():
		die()


func fly() -> void:
	if Input.is_action_just_pressed("fly"):
		velocity.y = POWER
	

func die() -> void:
	anim_sprite.stop()
	set_physics_process(false)
