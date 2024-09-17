extends "res://Scenes/Restaurant_Items/items_script.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	my_signal = SignalScript.wall_upgrade
	sprite.texture = my_texture
	my_signal.connect(upgrade_self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	sprite.frame = state
	
func upgrade_self():
	if state < 3:
		state += 1
