extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	# variable that stores direction of player from input
	var direction = (Input.get_action_strength("right") - Input.get_action_strength("left"))
	
	print(direction)
	
