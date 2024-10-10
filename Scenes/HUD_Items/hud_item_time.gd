extends "res://Scenes/HUD_Items/hud_item.gd"

var start_of_day = StatsScript.day_length[0]
var end_of_day = StatsScript.day_length[1]
var total_time : float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_2d.texture = my_texture
	total_time = start_of_day
	SignalScript.upgrade_button.connect(pause_time)
	SignalScript.pause_time.connect(pause_time)
	SignalScript.close_upgrade.connect(unpause_time)
	SignalScript.unpause_time.connect(reset_stats)
	SignalScript.work_button.connect(work)

	
func _physics_process(delta: float) -> void:
	total_time += delta / 1
	
	var time = int(total_time)
	StatsScript.time = time
	
	# Determine AM/PM suffix
	var am_pm = "AM"
	if time > 12 and time <= end_of_day:
		am_pm = "PM"
		time -= 12
	if time > end_of_day:
		SignalScript.end_of_day.emit()
		am_pm = "AM"
		total_time = start_of_day
		time = start_of_day
		
	
		
	label.text = str(time) + am_pm
	
func pause_time():
	set_physics_process(false)
	
func unpause_time():
	set_physics_process(true)
	
func work():
	await get_tree().create_timer(1).timeout
	total_time += 0.5
	
func reset_stats():
	StatsScript.day += 1
	StatsScript.customers_served = 0
	StatsScript.money_earned = 0
	unpause_time()
