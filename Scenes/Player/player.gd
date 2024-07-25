extends CharacterBody2D

@export var move_speed : float = 100 # the move speed of character, is able to be edited from inspector
	

func _physics_process(_delta):
	# variable that stores direction of player from input
	var input_direction = (Input.get_action_strength("right") - Input.get_action_strength("left"))
	
	velocity = input_direction * move_speed # velocity is equal to the direction and move speed
	
	move_and_slide()
	
	
