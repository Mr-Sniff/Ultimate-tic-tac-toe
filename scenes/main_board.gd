extends Node2D
@onready var cross: TextureRect = $cross
@onready var circle: TextureRect = $circle

@export var subgrids : Array[Node2D] = []

var winner : int = 0


func check_win():
	var x_winners = []
	var o_winners = []
	for grid in subgrids:
		if grid.winner == 1:
			x_winners.append(grid.id)
		if grid.winner == 2:
			o_winners.append(grid.id)
	
	var win_cons = BoardManager.win_cons
	
	for con in win_cons:
		if con.all(func(cell_id): return cell_id in x_winners):
			winner = 1
			cross.visible = true
		if con.all(func(cell_id): return cell_id in o_winners):
			winner = 2
			circle.visible = true
	BoardManager.winner = winner
	print("Main_board")
	print("x_winners: " + str(x_winners))
	print("o_winners: " + str(o_winners))
	print("winner: " + str(winner))
