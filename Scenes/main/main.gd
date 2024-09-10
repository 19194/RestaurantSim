extends Node2D

@onready var upgrade_menu = $UpgradeMenu
@onready var player = $Player
@onready var interactive_button = $Interactive_Button

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalScript.work_button.connect(work_button_pressed)
	SignalScript.upgrade_button.connect(upgrade_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Space") and upgrade_menu.visible == true:
		upgrade_menu.visible = false
		player.process_mode = Node.PROCESS_MODE_INHERIT
		interactive_button.process_mode = Node.PROCESS_MODE_INHERIT
	

func work_button_pressed():
	print("work")

func upgrade_button_pressed():
	var offset : float = player.position.x - 808.125
	upgrade_menu.position.x = offset
	upgrade_menu.visible = true
	player.process_mode = Node.PROCESS_MODE_DISABLED
	interactive_button.process_mode = Node.PROCESS_MODE_DISABLED
