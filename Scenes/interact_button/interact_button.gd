extends Node2D  # or Control if using a UI node

@export var button_signal: String = ""

var player_in_range = false
@onready var interactive_button = $"."
@onready var animation_player = $AnimationPlayer


func _ready():
	interactive_button.visible = false  # Hide the button initially
  
func _process(_delta):
	if player_in_range and Input.is_action_just_pressed("Space"):  # Default is the Enter key or Spacebar
		if button_signal == "work":
			SignalScript.work_button.emit()
		elif button_signal == "upgrade":
			SignalScript.upgrade_button.emit()

func _on_area_2d_area_entered(_body):
	player_in_range = true
	interactive_button.visible = true
	animation_player.play("idle")


func _on_area_2d_area_exited(_area):
	player_in_range = false
	interactive_button.visible = false
	animation_player.stop()
