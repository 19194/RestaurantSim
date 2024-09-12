extends Node2D

@onready var label_furniture_cost: Label = $Label_Furniture_Cost
@onready var label_walls_cost: Label = $Label_Walls_Cost
@onready var label_kitchen_cost: Label = $Label_Kitchen_Cost

@onready var button_furniture: Button = $Button_Furniture
@onready var button_walls: Button = $Button_Walls
@onready var button_kitchen: Button = $Button_Kitchen


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalScript.upgrade_button.connect(upgrade_button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func upgrade_button_pressed():
	update_costs()

func update_costs():
	label_furniture_cost.text = "Cost: $" + str(StatsScript.furniture_cost[StatsScript.furniture_state])
	label_walls_cost.text = "Cost: $" + str(StatsScript.wall_cost[StatsScript.wall_state])
	label_kitchen_cost.text = "Cost: $" + str(StatsScript.kitchen_cost[StatsScript.kitchen_state])
		


func _on_button_furniture_pressed() -> void:
	SignalScript.furniture_upgrade.emit()


func _on_button_walls_pressed() -> void:
	SignalScript.wall_upgrade.emit()


func _on_button_kitchen_pressed() -> void:
	SignalScript.kitchen_upgrade.emit()
