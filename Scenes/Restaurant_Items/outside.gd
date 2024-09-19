extends Node2D

@onready var sprite = $Sprite2D

@export var state : int = 0
@export var my_texture : Texture

var time = StatsScript.time
var outside_changes = StatsScript.outside_changes


# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.texture = my_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	time = StatsScript.time
	update_outside()
	sprite.frame = state
	
func update_outside():
	for index in range(0, 4):
		if time >= outside_changes[index]:
			state = index
