extends Node


const MAIN_MENU: PackedScene = preload("res://scenes/main_menu.tscn")
const GAME: PackedScene = preload("res://scenes/game.tscn")

const SCROLL_SPEED: float = 120
const PLANE_GROUP: String = "Plane"

func change_scene(newScene: PackedScene) -> void: 
	get_tree().change_scene_to_packed(newScene)

func load_game_scene() -> void: 
	change_scene(GAME)

func load_main_menu_scene() -> void:
	change_scene(MAIN_MENU)
