extends Node2D

@onready var sprite = $Sprite2D

@export var state : int = 0
@export var my_texture : Texture


# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.texture = my_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	sprite.frame = state
