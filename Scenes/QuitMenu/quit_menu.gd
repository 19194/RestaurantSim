extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_stay_pressed():
	visible = false


func _on_button_leave_pressed():
	get_tree().quit()


func _on_button_stay_button_down():
	$ButtonStay/CenterContainer.position.y = 16.875


func _on_button_stay_button_up():
	$ButtonStay/CenterContainer.position.y = 0


func _on_button_leave_button_down():
	$ButtonLeave/CenterContainer.position.y = 16.875


func _on_button_leave_button_up():
	$ButtonLeave/CenterContainer.position.y = 0
