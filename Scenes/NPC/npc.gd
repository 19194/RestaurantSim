extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

@export var my_texture : Texture


var location
var at_location = false
var move_speed = 350


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_2d.texture = my_texture
	location = StatsScript.locations.pick_random()
	StatsScript.locations.erase(location)
	print(location)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not at_location:
		walk_to_location(delta)
	else:
		state_machine.travel("Sit")
		animation_tree.set("parameters/Sit/blend_position", Vector2(location[1], 0))
	
func walk_to_location(delta):
	var distance = location[0] - position.x
	var direction = sign(distance)
	distance = abs(distance)
	
	if distance > 5:
		position.x += direction * move_speed * delta
	else:
		position.x = location[0]
		at_location = true
