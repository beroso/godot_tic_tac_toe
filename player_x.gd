tool
extends Node2D

export var draw_velocity := 1.0
export var width := 4.0
export var length := 32.0
export var color := Color.greenyellow

var t := 0.0

func _process(delta) -> void:
	t += delta * draw_velocity
	update()
	if t >= 1.0:
		finish_animation()


func _draw() -> void:
	var antialiased := true
	var main_diagonal_pos := top_left().linear_interpolate(bottom_right(), t)
	var anti_diagonal_pos := top_right().linear_interpolate(bottom_left(), t)

	draw_line(top_left(), main_diagonal_pos, color, width, antialiased)
	draw_line(top_right(), anti_diagonal_pos, color, width, antialiased)


func finish_animation() -> void:
	if Engine.editor_hint:
		t = 0.0
	else:
		set_process(false)


func bottom_left() -> Vector2:
	return Vector2(-1, 1) * length / 2


func bottom_right() -> Vector2:
	return Vector2(1, 1) * length / 2
	

func top_right() -> Vector2:
	return Vector2(1, -1) * length / 2


func top_left() -> Vector2:
	return  Vector2(-1, -1) * length / 2
