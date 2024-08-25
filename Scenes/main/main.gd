extends Node2D

@onready var upgrade_menu = $UpgradeMenu
@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalScript.work_button.connect(work_button_pressed)
	SignalScript.upgrade_button.connect(upgrade_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func work_button_pressed():
	print("work")

func upgrade_button_pressed():
	var offset : float = player.position.x - 808.125
	upgrade_menu.position.x = offset
	upgrade_menu.visible = true
