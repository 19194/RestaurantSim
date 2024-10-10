extends Node2D

func _process(_delta):
	if $CanvasLayer.visible:
		$PlayButton.disabled = true
		$ExitButton.disabled = true
	else:
		$PlayButton.disabled = false
		$ExitButton.disabled = false


func _on_play_button_pressed():
	GameScript.load_game_scene()


func _on_exit_button_pressed():
	$CanvasLayer.visible = true
