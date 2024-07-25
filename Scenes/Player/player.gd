extends CharacterBody2D

@export var move_speed : float = 100 # the move speed of character, is able to be edited from inspector

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	# variable that stores direction of player from input
	var input_direction = (Input.get_action_strength("right") - Input.get_action_strength("left"))
	
	velocity = input_direction * move_speed
	
