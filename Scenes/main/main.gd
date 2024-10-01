extends Node2D

@onready var upgrade_menu = $UpgradeMenu
@onready var player = $Player
@onready var button_upgrade = $Button_Upgrade

@onready var walls: Node2D = $Walls
@onready var kitchen: Node2D = $Kitchen
@onready var furniture: Node2D = $Furniture
@onready var button_work = $Button_Work


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalScript.work_button.connect(work_button_pressed)
	SignalScript.upgrade_button.connect(upgrade_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Space") and upgrade_menu.visible == true:
		SignalScript.close_upgrade.emit()
		upgrade_menu.visible = false
		player.process_mode = Node.PROCESS_MODE_INHERIT
		button_upgrade.process_mode = Node.PROCESS_MODE_INHERIT
	

func work_button_pressed():
	button_work.visible = false
	button_work.process_mode = Node.PROCESS_MODE_DISABLED
	button_upgrade.process_mode = Node.PROCESS_MODE_DISABLED
	

func upgrade_button_pressed():
	var offset : float = player.position.x - 808.125
	upgrade_menu.position.x = offset
	upgrade_menu.visible = true
	player.process_mode = Node.PROCESS_MODE_DISABLED
	button_upgrade.process_mode = Node.PROCESS_MODE_DISABLED
	
func upgrade_kitchen():
	pass
