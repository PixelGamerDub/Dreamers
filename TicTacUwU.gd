extends Node

# cell states
const CELL_EMPTY = ""
const CELL_X = "X"
const CELL_O = "0"

@onready var buttons = $GridContainer.get_children()

# Game States
var current_player
var board

# Called when the node enters the scene tree for the first time.
func _ready():
	var button_index = 0
	for button in buttons:
		button.connect("pressed", _on_button_click.bind(button_index, button))
		button_index += 1
	reset_game()

func _on_button_click(idx, button) :
	#translating index position to (X, Y) Position.
	var y = idx / 3
	var x = idx % 3
	
	button.text = current_player
	
	
	if current_player == CELL_X:
		current_player = CELL_O 
	else:
		current_player=CELL_X
	button.disabled = true

func reset_game ():
	current_player = CELL_X
	board = [
		[CELL_EMPTY,CELL_EMPTY,CELL_EMPTY],
		[CELL_EMPTY,CELL_EMPTY,CELL_EMPTY],
		[CELL_EMPTY,CELL_EMPTY,CELL_EMPTY],
	]
