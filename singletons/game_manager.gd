extends Node


const MAIN_MENU: PackedScene = preload("res://scenes/main_menu.tscn")
const GAME: PackedScene = preload("res://scenes/game.tscn")

const SCROLL_SPEED: float = 120
const PLANE_GROUP: String = "Plane"


func load_game_scene() -> void: 
	get_tree().change_scene_to_packed(GAME)
