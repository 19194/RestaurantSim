extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Space") and visible == true:
		# SignalScript.unpause_time
		GameScript.load_game_scene()
		


func _on_visibility_changed() -> void:
	update_text()
	
	
func update_text():
	$Day/Label_Edit.text = str(StatsScript.day)
	$Money/Label_Edit.text = "$" + str(StatsScript.money_earned)
	$CusomerServed/Label_Edit.text = str(StatsScript.customers_served)
	$CustomerSatisfaction/Label_Edit.text = str(StatsScript.satisfaction) + "%"
