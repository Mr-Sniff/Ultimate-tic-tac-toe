extends Node

# signal clicked_cell(grid_index, cell_index)
signal clicked_cell

func _ready() -> void:
	clicked_cell.connect(test_click_func)



func test_click_func(grid_index, cell_index):
	print("Grid_index: " + str(grid_index))
	print("Cell_index: " + str(cell_index))
