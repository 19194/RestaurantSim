extends CanvasLayer

@onready var color_rect = $ColorRect
@onready var player: CharacterBody2D = $"../Player"


var fading_in = false
var fading_out = false
var fade_speed = 1.2  # Adjust the speed of the fade

func _ready():
	color_rect.color.a = 1 # Ensure the ColorRect is initially transparent
	SignalScript.work_button.connect(work_button_pressed)
	fade_from_black()

func fade_to_black():
	fading_out = true

func fade_from_black():
	fading_in = true

func _process(delta):
	if fading_out:
		visible = true
		player.process_mode = Node.PROCESS_MODE_DISABLED
		color_rect.color.a += fade_speed * delta  # Increase alpha to fade out
		if color_rect.color.a >= 1:
			color_rect.color.a = 1
			fading_out = false
			# You can add additional logic here, like signaling when the screen is fully black.
	elif fading_in:
		player.process_mode = Node.PROCESS_MODE_INHERIT
		color_rect.color.a -= fade_speed * delta  # Decrease alpha to fade in
		if color_rect.color.a <= 0:
			color_rect.color.a = 0
			fading_in = false
			visible = false
			# Add any logic for when the screen is fully faded back.
			

func work_button_pressed():
	fade_to_black()
	get_tree().create_timer(2) # Wait for 2 seconds
	StatsScript.holding_food = true
	fade_from_black()
