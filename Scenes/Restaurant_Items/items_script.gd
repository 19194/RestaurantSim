extends Node2D

@onready var sprite = $Sprite2D

@export var state : float = 1
@export var texture : Texture = sprite.texture


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass
