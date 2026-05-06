class_name subgrid_data
extends Resource

@export  var id : int = 0

@export var cells = [0,0,0, 0,0,0, 0,0,0] 
# 0: empty, 1: X, 2: O

@export var winner = 0 
# 0: none, 1: X, 2: O, 3: Tie

@export var is_full = false

func check_win():

	pass
