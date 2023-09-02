extends Node3D

@export var starting_tile: Tile
@onready var the_dice_roller = $"../../UI/Dice Roller"
var current_tile = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func stone_clicked():
	if the_dice_roller.is_done_rolling == false:
		return

	var spaces_to_move = the_dice_roller.dice_total

	var final_tile = current_tile

	for i in range(0, spaces_to_move):
		print_debug('We are moving ' + str(spaces_to_move) + ' spaces')
		if final_tile == null:
			final_tile = starting_tile
		else:
			final_tile = final_tile.next_tiles[0]

	if final_tile == null:
		print_debug("We hit an off board tile")
		return

	print_debug("Current position is: " + str(position) + " going to: " + str(final_tile.position))
	position = final_tile.position
	position = Vector3(0, 1, 1)
	current_tile = final_tile


func _on_static_body_3d_input_event(_camera:Node, event:InputEvent, _position:Vector3, _normal:Vector3, _shape_idx:int):
	if event is InputEventMouseButton:
		var button_event = event as InputEventMouseButton
		if button_event.button_index == 1 and button_event.pressed == false:
			stone_clicked()
		
			
