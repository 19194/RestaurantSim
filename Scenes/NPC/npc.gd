extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")
@onready var interact_button: Node2D = $Interact_Button
@onready var timer: Timer = $Timer
@onready var stats = StatsScript

@export var my_texture : Texture


var location
var at_location = false
var move_speed = 350
var player_in_range = false
var satisfaction = 0
var wait_time = 0
var served = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_2d.texture = my_texture
	interact_button.visible = false
	location = stats.locations.pick_random()
	stats.locations.erase(location)
	SignalScript.pause_time.connect(end_day)
	

func _process(_delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("Space"):
		served = true
		stats.holding_food = false
		player_in_range = false
		interact_button.visible = false
		$Interact_Button/AnimationPlayer.stop()
		timer.start(randi_range(1, 10))
		await timer.timeout
		stats.locations.append(location)
		location = [-600, 0]
		at_location = false
		calc_satisfaction()
		
	if position.x <= -500:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not at_location:
		state_machine.travel("Walk")
		walk_to_location(delta)
	else:
		wait_time += delta
		state_machine.travel("Sit")
		animation_tree.set("parameters/Sit/blend_position", Vector2(location[1], 0))
	
func walk_to_location(delta):
	var distance = location[0] - position.x
	var direction = sign(distance)
	distance = abs(distance)
	animation_tree.set("parameters/Walk/blend_position", Vector2(direction, 0))
	
	if distance > 5:
		position.x += direction * move_speed * delta
	else:
		position.x = location[0]
		at_location = true


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "Interact_Area":
		if stats.holding_food and at_location:
			player_in_range = true
			interact_button.visible = true
			$Interact_Button/AnimationPlayer.play("idle")


func _on_area_2d_area_exited(_area: Area2D) -> void:
	player_in_range = false
	interact_button.visible = false
	$Interact_Button/AnimationPlayer.stop()
	
func calc_satisfaction():
	served = false
	StatsScript.customers_served += 1
	var restaurant_effect = 0
	restaurant_effect += stats.furniture_effect[stats.furniture_state]
	restaurant_effect += stats.wall_effect[stats.wall_state]
	restaurant_effect += stats.kitchen_effect[stats.kitchen_state]
	
	satisfaction = int((70 + restaurant_effect * 2) / wait_time)
	satisfaction += randi_range(-10, int(restaurant_effect/2))
	stats.satisfaction = int((satisfaction + stats.satisfaction) / 2)
	stats.satisfaction = clamp(stats.satisfaction, 0, 100)
	
	var money = int(satisfaction * randf_range(0.7, 3))
	money = clamp(money, 5, 1000)
	stats.money += money
	stats.money_earned += money
	stats.money = clamp(stats.money, 0, 9999)
	
	
func end_day():
	timer.stop()
	if served:
		calc_satisfaction()
	else:
		stats.satisfaction -= int(wait_time)
	set_physics_process(false)
	set_process(false)
	process_mode = Node.PROCESS_MODE_DISABLED
