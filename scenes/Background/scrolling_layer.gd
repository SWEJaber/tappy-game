extends ParallaxLayer

const IMG_W: float = 1920
const IMG_H: float = 1080

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var texture: Texture2D
@export var scroll_scale: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	motion_scale.x = scroll_scale
	
	var scale_factor = get_viewport_rect().size.y / IMG_H
	
	sprite_2d.texture = texture
	sprite_2d.scale = Vector2(scale_factor, scale_factor)
	
	motion_mirroring.x = IMG_W * scale_factor
