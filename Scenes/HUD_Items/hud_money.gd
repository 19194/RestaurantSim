extends "res://Scenes/HUD_Items/hud_item.gd"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_2d.texture = my_texture
	SignalScript.upgrade_button.connect(upgrade_menu)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	update_text()
	
func upgrade_menu():
	pass
	
func update_text():
	label.text = "$" + str(StatsScript.money)
