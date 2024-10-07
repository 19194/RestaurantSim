extends Node2D  # or Control if using a UI node

@export var button_signal: String = ""

var player_in_range = false
@onready var animation_player = $AnimationPlayer
@onready var label = $Label

func _ready():
	visible = false  # Hide the button initially
	label.text = "[SPACE] to " + button_signal
  
func _process(_delta):
	if player_in_range and Input.is_action_just_pressed("Space"):  # Default is the Enter key or Spacebar
		if button_signal == "Work":
			SignalScript.work_button.emit()
		elif button_signal == "Upgrade":
			SignalScript.upgrade_button.emit()

func _on_area_2d_area_entered(area):
	if area.name == "Interact_Area":
		player_in_range = true
		visible = true
		animation_player.play("idle")


func _on_area_2d_area_exited(area):
	if area.name == "Interact_Area":
		player_in_range = false
		visible = false
		animation_player.stop()
