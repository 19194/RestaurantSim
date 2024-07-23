extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# variable that stores direction of player from input
	var direction = (Input.get_action_strength("right") - Input.get_action_strength("left"))
	
