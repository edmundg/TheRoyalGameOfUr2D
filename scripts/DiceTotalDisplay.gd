extends Label

@onready var the_dice_roller = $"../Dice Roller"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if the_dice_roller.is_done_rolling == false:
		text = '= ?'
	else:
		text = '= ' + str(the_dice_roller.dice_total)
