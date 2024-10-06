extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")
@onready var interact_button: Node2D = $Interact_Button
@onready var timer: Timer = $Timer

@export var my_texture : Texture


var location
var at_location = false
var move_speed = 350
var player_in_range = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_2d.texture = my_texture
	interact_button.visible = false
	location = StatsScript.locations.pick_random()
	StatsScript.locations.erase(location)
	

func _process(delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("Space"):
		StatsScript.holding_food = false
		player_in_range = false
		interact_button.visible = false
		$Interact_Button/AnimationPlayer.stop()
		timer.start(randi_range(1, 10))
		await timer.timeout
		StatsScript.locations.append(location)
		location = [-600, 0]
		at_location = false
		
	if position.x <= -500:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not at_location:
		state_machine.travel("Walk")
		walk_to_location(delta)
	else:
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
	if StatsScript.holding_food == true:
		player_in_range = true
		interact_button.visible = true
		$Interact_Button/AnimationPlayer.play("idle")


func _on_area_2d_area_exited(area: Area2D) -> void:
	player_in_range = false
	interact_button.visible = false
	$Interact_Button/AnimationPlayer.stop()
