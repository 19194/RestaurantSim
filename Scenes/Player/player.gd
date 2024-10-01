extends CharacterBody2D

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

var move_speed : float = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	# variable that stores direction of player from input
	var input_direction = Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"), 0)
	
	velocity = input_direction * move_speed
	
	move_and_slide()
	update_animation_tree(input_direction)
	update_animation_state()
	
	
func update_animation_tree(move_input : Vector2):
	if (move_input != Vector2.ZERO): # if the player is moving
		if StatsScript.holding_food == false:
			animation_tree.set("parameters/Walk/blend_position", move_input) # set the animation in the direction of movement for walk
			animation_tree.set("parameters/Idle/blend_position", move_input) # set the animation in the direction of movement for idle
		else:
			animation_tree.set("parameters/Walk_Food/blend_position", move_input) # set the animation in the direction of movement for walk
			animation_tree.set("parameters/Idle_Food/blend_position", move_input) # set the animation in the direction of movement for idle
			
		
func update_animation_state():
	if StatsScript.holding_food == false:
		if (velocity != Vector2.ZERO):
			state_machine.travel("Walk")
		elif (velocity == Vector2.ZERO):
			state_machine.travel("Idle")
	else:
		if (velocity != Vector2.ZERO):
			state_machine.travel("Walk_Food")
		elif (velocity == Vector2.ZERO):
			state_machine.travel("Idle_Food")
