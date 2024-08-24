extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalScript.upgrade_button.connect(upgrade_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func upgrade_button_pressed():
	print("upgrade")
