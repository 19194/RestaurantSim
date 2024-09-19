extends "res://Scenes/HUD_Items/hud_item.gd"

var date = StatsScript.day


# Called when the node enters the scene tree for the first time.
func _ready():
	sprite_2d.texture = my_texture
	label.position = Vector2(38, 25)
	label.add_theme_font_size_override("font_size", 48)
	update_day()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	update_day()


func update_day():
	date = StatsScript.day
	label.text = "Day " + str(date)
