extends Node2D

@onready var sprite = $Sprite2D

@export var state : int = 0
@export var my_texture : Texture
@export var my_signal : Signal
@export var my_costs : Array


# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.texture = my_texture
	my_signal.connect(upgrade_self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	sprite.frame = state
	
func upgrade_self():
	if state < 3:
		if StatsScript.money >= my_costs[state]:
			StatsScript.money -= my_costs[state]
			state += 1
			print(StatsScript.money)
