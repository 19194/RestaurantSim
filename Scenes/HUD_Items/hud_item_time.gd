extends "res://Scenes/HUD_Items/hud_item.gd"

var total_time : float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_2d.texture = my_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	total_time += delta * 2
	
	var time = int(total_time)
	
	# Convert to 12-hour format
	var hours_12 = time % 12
	if hours_12 == 0:
		hours_12 = 12  # Handle midnight and noon
	
	# Determine AM/PM suffix
	var am_pm = "AM"
	if time > 12 and time < 25:
		am_pm = "PM"
		time -= 12
	if (time + 12) > 24:
		am_pm = "AM"
		total_time = 1
		
	label.text = str(time) + am_pm
	
