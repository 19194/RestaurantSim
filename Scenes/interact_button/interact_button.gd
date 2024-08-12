extends Node2D  # or Control if using a UI node

var player_in_range = false
@onready var interactive_button = $"."


func _ready():
	interactive_button.visible = false  # Hide the button initially

func _on_Area2D_body_entered(body):
	if body.name == "Player":  # Assuming the player's node is named "Player"
		player_in_range = true
		interactive_button.visible = true

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		player_in_range = false
		interactive_button.visible = false
  
func _process(_delta):
	if player_in_range and Input.is_action_just_pressed("Space"):  # Default is the Enter key or Spacebar
		_on_Button_pressed()

func _on_Button_pressed():
	print("Button activated!")
	# Add the functionality for when the button is pressed


func _on_area_2d_area_entered(area):
	pass # Replace with function body.
