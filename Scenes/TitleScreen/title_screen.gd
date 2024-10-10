extends Node2D

func _process(_delta):
	if $QuitMenu.visible or $Tutorial.visible:
		$PlayButton.disabled = true
		$ExitButton.disabled = true
		$ButtonTutorial.disabled = true
	else:
		$PlayButton.disabled = false
		$ExitButton.disabled = false
		$ButtonTutorial.disabled = false
		
	if Input.is_action_just_pressed("Space") and $Tutorial.visible:
		$Tutorial.visible = false


func _on_play_button_pressed():
	GameScript.load_game_scene()


func _on_exit_button_pressed():
	$QuitMenu.visible = true


func _on_button_tutorial_pressed():
	$Tutorial.visible = true


func _on_button_tutorial_button_down():
	$ButtonTutorial/CenterContainer.position.y = 16.875


func _on_button_tutorial_button_up():
	$ButtonTutorial/CenterContainer.position.y = 0
