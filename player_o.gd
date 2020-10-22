tool
extends Node2D

export var draw_velocity := 6.28
export var radius := 16.0
export var width := 4.0
export var color := Color.aqua

var end_angle := 0.0

func _process(delta) -> void:
	end_angle += (delta * draw_velocity)
	update()
	if end_angle >= TAU:
		finish_animation()


func _draw() -> void:
	var start_angle := 0.0
	var point_count := 60
	var antialiased := true
	draw_arc(Vector2.ZERO, radius + width, start_angle, end_angle, point_count, color, width, antialiased)


func finish_animation() -> void:
	if Engine.editor_hint:
		end_angle = 0.0
	else:
		set_process(false)
