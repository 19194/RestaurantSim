extends Node2D  # or Control if using a UI node

var player_in_range = false
@onready var interactive_button = $"."


func _ready():
	interactive_button.visible = false  # Hide the button initially
  
func _process(_delta):
	if player_in_range and Input.is_action_just_pressed("Space"):  # Default is the Enter key or Spacebar
		pass
