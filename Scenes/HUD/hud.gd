extends CanvasLayer

@onready var hud_money: Control = $HUD_Money
@onready var hud_time: Control = $HUD_Time
@onready var hud_day: Control = $HUD_Day
@onready var hud_emotion: Control = $HUD_Emotion


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalScript.upgrade_button.connect(hide_hud)
	SignalScript.close_upgrade.connect(show_hud)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func hide_hud():
	hud_day.visible = false
	hud_emotion.visible = false
	hud_time.visible = false
	
	hud_money.position = Vector2(715.31, 253.125)
	
func show_hud():
	hud_day.visible = true
	hud_emotion.visible = true
	hud_time.visible = true
	
	hud_money.position = Vector2(1430.62, 0)
