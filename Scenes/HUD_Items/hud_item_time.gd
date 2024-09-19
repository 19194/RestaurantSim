extends "res://Scenes/HUD_Items/hud_item.gd"

var start_of_day = StatsScript.day_length[0]
var end_of_day = StatsScript.day_length[1]
var total_time : float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_2d.texture = my_texture
	total_time = start_of_day

	
func _physics_process(delta: float) -> void:
	total_time += delta * 2
	
	var time = int(total_time)
	StatsScript.time = time
	
	# Determine AM/PM suffix
	var am_pm = "AM"
	if time > 12 and time <= end_of_day:
		am_pm = "PM"
		time -= 12
	if time > end_of_day:
		am_pm = "AM"
		total_time = start_of_day
		time = start_of_day
		StatsScript.day += 1
	
		
	label.text = str(time) + am_pm
	
