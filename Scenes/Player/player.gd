extends CharacterBody2D

@onready var animation_tree = $AnimationTree

var move_speed : float = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	# variable that stores direction of player from input
	var input_direction = Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"), 0)
	
	update_animation_tree(input_direction)
	
	velocity = input_direction * move_speed
	
	move_and_slide()
	
	
func update_animation_tree(move_input : Vector2):
	if (move_input != Vector2.ZERO): # if the player is moving
		animation_tree.set("parameters/Walk/blend_position", move_input) # set the animation in the direction of movement for walk
		#animation_tree.set("parameters/Idle/blend_position", move_input) # set the animation in the direction of movement for idle
