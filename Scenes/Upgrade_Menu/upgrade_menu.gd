extends Node2D

@onready var label_furniture_cost: Label = $Label_Furniture_Cost
@onready var label_walls_cost: Label = $Label_Walls_Cost
@onready var label_kitchen_cost: Label = $Label_Kitchen_Cost

@onready var button_furniture: Button = $Button_Furniture
@onready var button_walls: Button = $Button_Walls
@onready var button_kitchen: Button = $Button_Kitchen


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalScript.upgrade_button.connect(update_costs)
	SignalScript.update_prices.connect(update_costs)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	update_costs()

func update_costs():
	var furniture_int = StatsScript.furniture_state
	var wall_int = StatsScript.wall_state
	var kitchen_int = StatsScript.kitchen_state
	
	check_costs(furniture_int, StatsScript.furniture_cost, label_furniture_cost)
	check_costs(wall_int, StatsScript.wall_cost, label_walls_cost)
	check_costs(kitchen_int, StatsScript.kitchen_cost, label_kitchen_cost)
	
	disable_buttons(furniture_int, StatsScript.furniture_cost, button_furniture)
	disable_buttons(wall_int, StatsScript.wall_cost, button_walls)
	disable_buttons(kitchen_int, StatsScript.kitchen_cost, button_kitchen)
	
func check_costs(state, costs, label):
	if state < 3:
		label.text = "Cost: $" + str(costs[state])
	else:
		label.text = "------"
		


func _on_button_furniture_pressed() -> void:
	SignalScript.furniture_upgrade.emit()


func _on_button_walls_pressed() -> void:
	SignalScript.wall_upgrade.emit()


func _on_button_kitchen_pressed() -> void:
	SignalScript.kitchen_upgrade.emit()
	
func disable_buttons(state, cost, button):
	if state < 3:
		if cost[state] >= StatsScript.money:
			button.disabled = true
		else:
			button.disabled = false
	else:
		button.disabled = true
