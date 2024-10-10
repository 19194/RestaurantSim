extends Node2D

@onready var upgrade_menu = $UpgradeMenu
@onready var player = $Player
@onready var button_upgrade = $Button_Upgrade
@onready var button_work = $Button_Work
@onready var npc_array: Node = $NPC_Array
@onready var timer: Timer = $Timer
@onready var quit_menu = $QuitMenu

var npc_scene = preload("res://Scenes/NPC/npc.tscn")
#var spawn_timer_range = Vector2(5, 60)
var spawn_timer_range = Vector2(1, 10)
var npc_textures = [load("res://Assets/NPC/Alan NPC.png"), load("res://Assets/NPC/HawkTuah_NPC.png")]


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalScript.work_button.connect(work_button_pressed)
	SignalScript.upgrade_button.connect(upgrade_button_pressed)
	timer.start(randi_range(spawn_timer_range[0], spawn_timer_range[1]))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("Space") and upgrade_menu.visible == true:
		SignalScript.close_upgrade.emit()
		upgrade_menu.visible = false
		player.process_mode = Node.PROCESS_MODE_INHERIT
		button_upgrade.process_mode = Node.PROCESS_MODE_INHERIT
		
	if StatsScript.holding_food == true:
		button_work.process_mode = Node.PROCESS_MODE_DISABLED
		button_upgrade.process_mode = Node.PROCESS_MODE_DISABLED
	else:
		button_work.process_mode = Node.PROCESS_MODE_INHERIT
		button_upgrade.process_mode = Node.PROCESS_MODE_INHERIT
		
		
	if Input.is_action_just_pressed("escape"):
		if quit_menu.visible == false:
			quit_menu.visible = true
		elif quit_menu.visible == true:
			quit_menu.visible = false
			
	if quit_menu.visible == true and Input.is_action_just_pressed("escape"):
		$HUD.visible = false
		player.process_mode = Node.PROCESS_MODE_DISABLED
		button_upgrade.process_mode = Node.PROCESS_MODE_DISABLED
		button_work.process_mode = Node.PROCESS_MODE_DISABLED
		for i in range(npc_array.get_child_count()):
			var child_node = npc_array.get_child(i)
			child_node.process_mode = Node.PROCESS_MODE_DISABLED
			
	elif quit_menu.visible == false and Input.is_action_just_pressed("escape"):
		$HUD.visible = true
		player.process_mode = Node.PROCESS_MODE_INHERIT
		button_upgrade.process_mode = Node.PROCESS_MODE_INHERIT
		button_work.process_mode = Node.PROCESS_MODE_INHERIT
		for i in range(npc_array.get_child_count()):
			var child_node = npc_array.get_child(i)
			child_node.process_mode = Node.PROCESS_MODE_INHERIT

func work_button_pressed():
	button_work.visible = false
	

func upgrade_button_pressed():
	var offset : float = player.position.x - 808.125
	upgrade_menu.position.x = offset
	upgrade_menu.visible = true
	player.process_mode = Node.PROCESS_MODE_DISABLED
	button_upgrade.process_mode = Node.PROCESS_MODE_DISABLED
	
func spawn_npc():
	if StatsScript.locations.size() != 0:
		var new_npc = npc_scene.instantiate()
		new_npc.my_texture = npc_textures.pick_random()
		new_npc.position = Vector2(-200, 421.875)
		npc_array.add_child(new_npc)
	
	timer.start(randi_range(spawn_timer_range[0], spawn_timer_range[1]))
	

func _on_timer_timeout() -> void:
	spawn_npc()
