extends GridContainer

var dice_values = [0, 0, 0, 0]
var dice_total = 0

var is_done_rolling = false

@export var dice_image_zero : Array[Texture2D]
@export var dice_image_one : Array[Texture2D]

func _ready():
	pass


func _process(_delta):
	pass


func new_turn():
	is_done_rolling = false


func roll_the_dice():
	dice_total = 0
	for i in range(0, len(dice_values)):
		dice_values[i] = randi_range(0, 1) # Note 1 is inclusive
		dice_total += dice_values[i]

		if dice_values[i] == 0:
			(get_child(i) as TextureRect).texture = dice_image_zero[randi_range(0, len(dice_image_zero) - 1)]
		else:
			(get_child(i) as TextureRect).texture = dice_image_one[randi_range(0, len(dice_image_one) - 1)]
		
		is_done_rolling = true
