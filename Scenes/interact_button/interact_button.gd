extends Node2D  # or Control if using a UI node

var player_in_range = false

func _ready():
	$Button.visible = false  # Hide the button initially

func _on_Area2D_body_entered(body):
	if body.name == "Player":  # Assuming the player's node is named "Player"
		player_in_range = true
		$Button.visible = true

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		player_in_range = false
		$Button.visible = false

func _process(delta):
	if player_in_range and Input.is_action_just_pressed("ui_accept"):  # Default is the Enter key or Spacebar
		_on_Button_pressed()

func _on_Button_pressed():
	print("Button activated!")
	# Add the functionality for when the button is pressed
