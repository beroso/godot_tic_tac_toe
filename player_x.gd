tool
extends Node2D

export var draw_velocity := 1.0
export var width := 4.0
export var length := 32.0
export var color := Color.greenyellow

var t := 0.0
var main_diagonal_pos : Vector2
var other_diagonal_pos : Vector2

func _process(delta) -> void:
	t += delta * draw_velocity
	main_diagonal_pos = top_left().linear_interpolate(bottom_right(), t)
	other_diagonal_pos = top_right().linear_interpolate(bottom_left(), t)
	
	if top_left().distance_squared_to(main_diagonal_pos) >= top_left().distance_squared_to(bottom_right()):
		if Engine.editor_hint:
			t = 0
		else:
			set_process(false)

	update()


func _draw() -> void:
	var antialiased := true
	draw_line(top_left(), main_diagonal_pos, color, width, antialiased)
	draw_line(top_right(), other_diagonal_pos, color, width, antialiased)


func bottom_left() -> Vector2:
	return Vector2(-1, 1) * length / 2


func bottom_right() -> Vector2:
	return Vector2(1, 1) * length / 2
	

func top_right() -> Vector2:
	return Vector2(1, -1) * length / 2


func top_left() -> Vector2:
	return  Vector2(-1, -1) * length / 2
