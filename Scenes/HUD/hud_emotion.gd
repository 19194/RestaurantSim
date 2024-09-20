extends Control

@onready var sprite_2d: Sprite2D = $Sprite2D
@export var state = 0
var satisfaction
# Called when the node enters the scene tree for the first time.
func _ready():
	satisfaction = StatsScript.satisfaction


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	satisfaction = StatsScript.satisfaction
	change_emotion()
	sprite_2d.frame = state

func change_emotion():
	var values = [0, 25, 50, 75, 100]
	for i in range(0, 4):
		print(satisfaction)
		if satisfaction >= values[i] and satisfaction < values[i + 1]:
			state = i
		elif satisfaction >= 100:
			state = 3
