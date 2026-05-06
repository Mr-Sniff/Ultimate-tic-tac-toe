extends Node2D

@onready var cross: TextureRect = $cross
@onready var circle: TextureRect = $circle
@onready var overlay: Panel = $overlay

@export  var id : int = 0

@export var cells : Array[Node2D] = [] 
# 0: empty, 1: X, 2: O

@export var winner = 0 
# 0: none, 1: X, 2: O, 3: Tie

@export var is_full = false


func _ready() -> void:
	GlobalSingnals.clicked_cell.connect(_check_win)

func _process(delta: float) -> void:
	var active_color = Color(1, 1, 1, .4)
	var unactive_color = Color(0, 0, 0, .4)
	if check_placeable() and winner == 0:
		overlay.modulate = active_color
	else: 
		overlay.modulate = unactive_color
	
	_check_tie()

func check_placeable():
	if BoardManager.active_subgrid == id or BoardManager.active_subgrid == 0:
		return true
	return false

func _check_tie():
	if winner != 0:
		return false
	
	var all_filled = cells.all(func(cell): return cell.winner != 0)
	
	if all_filled:
		winner = 3
		is_full = true
		print("Subgrid " + str(id) + " is a tie!")
		return true
		
	return false


func _check_win():
	var x_winners = []
	var o_winners = []
	for cell in cells:
		if cell.winner == 1:
			x_winners.append(cell.id)
		if cell.winner == 2:
			o_winners.append(cell.id)
	
	var win_cons = BoardManager.win_cons
	
	for con in win_cons:
		if con.all(func(cell_id): return cell_id in x_winners):
			winner = 1
			cross.visible = true
		if con.all(func(cell_id): return cell_id in o_winners):
			winner = 2
			circle.visible = true
	
	if winner != 0:
		get_parent().check_win()
	print("subgrid: " + str(id))
	print("x_winners: " + str(x_winners))
	print("o_winners: " + str(o_winners))
	print("winner: " + str(winner))
