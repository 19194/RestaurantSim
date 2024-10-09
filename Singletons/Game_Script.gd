extends Node

var game_scene : PackedScene = preload("res://Scenes/main/main.tscn")

func load_game_scene():
	get_tree().change_scene_to_packed(game_scene)
