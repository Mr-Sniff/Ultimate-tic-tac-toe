extends Node


var win_cons = [
	#horizontal
	[1, 2, 3],
	[4, 5, 6],
	[7, 8, 9],
	#vertical
	[1, 4, 7],
	[2, 5, 8],
	[3, 6, 9],
	#diagonal
	[1, 5, 9],
	[3, 5, 7]
]

var active_turn : int = 1
var active_subgrid : int = 0 # 0 for any or specific id otherwise
var winner : int = 0

func update_turn():
	if active_turn == 1:
		active_turn = 2
	else: active_turn = 1

func set_active_grid(id):
	var main_grid = get_tree().get_first_node_in_group("main_board")
	if main_grid.subgrids[id-1].winner == 0:
		active_subgrid = id
	else:
		active_subgrid = 0
	

