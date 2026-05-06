extends Node2D

@onready var cross: TextureRect = $cross
@onready var circle: TextureRect = $circle


var mouse_hovering : bool = false

@export var winner = 0 
# 0: none, 1: X, 2: O, 3: Tie
#
@export var id : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if Input.is_action_just_pressed("left_click") and mouse_hovering and winner == 0 and placeable():
		winner = BoardManager.active_turn
		BoardManager.update_turn()
		# GlobalSingnals.clicked_cell.emit(get_parent().id, id)
		GlobalSingnals.clicked_cell.emit()
		BoardManager.set_active_grid(id)
		if winner == 1:
			cross.visible = true
		elif winner == 2:
			circle.visible = true


func placeable():
	if BoardManager.active_subgrid == 0 or BoardManager.active_subgrid == get_parent().id:
		if  BoardManager.winner == 0 and get_parent().winner == 0:
			return true
	return false

func _on_area_2d_mouse_entered() -> void:
	mouse_hovering = true

func _on_area_2d_mouse_exited() -> void:
	mouse_hovering = false
